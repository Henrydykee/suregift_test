import 'package:flutter/foundation.dart';
import 'package:suregift_test/core/data/cache/cache_service.dart';
import 'package:suregift_test/core/platform/string_constants.dart';
import 'package:suregift_test/features/cart/data/models/cart_item_model.dart';
import 'package:suregift_test/features/cart/data/models/cart_model.dart';
import 'package:suregift_test/features/cart/data/models/cart_totals_model.dart';
import 'package:suregift_test/features/cart/domain/usecases/cart_usecases.dart';

class CartProvider extends ChangeNotifier {
  final GetCartUseCase _getCart;
  final AddCartItemUseCase _addItem;
  final UpdateCartItemUseCase _updateItem;
  final RemoveCartItemUseCase _removeItem;
  final GetCartTotalUseCase _getTotal;
  final CacheService _cache;

  CartProvider({
    required GetCartUseCase getCart,
    required AddCartItemUseCase addItem,
    required UpdateCartItemUseCase updateItem,
    required RemoveCartItemUseCase removeItem,
    required GetCartTotalUseCase getTotal,
    required CacheService cache,
  })  : _getCart = getCart,
        _addItem = addItem,
        _updateItem = updateItem,
        _removeItem = removeItem,
        _getTotal = getTotal,
        _cache = cache;

  Cart _cart = Cart.empty;
  Cart get cart => _cart;

  bool _loading = false;
  bool get loading => _loading;

  bool _hasLoaded = false;
  bool get hasLoaded => _hasLoaded;

  String? _error;
  String? get error => _error;

  bool _showingCachedCart = false;
  bool get showingCachedCart => _showingCachedCart;

  String? get offlineNotice => _showingCachedCart
      ? 'You are viewing your last saved cart. Reconnect to edit items or check out.'
      : null;

  final Set<int> _busyItemIds = <int>{};
  bool isItemBusy(int id) => _busyItemIds.contains(id);

  bool _addingItem = false;
  bool get addingItem => _addingItem;

  CartTotals? _totals;
  CartTotals? get totals => _totals;
  bool _totalsLoading = false;
  bool get totalsLoading => _totalsLoading;
  String? _totalsError;
  String? get totalsError => _totalsError;

  Future<bool> loadCart({bool forceRefresh = false}) async {
    if (_loading) return false;
    if (_hasLoaded && !forceRefresh && _error == null) return true;
    if (_cart.items.isEmpty) {
      _restoreCachedCart();
    }
    return _refetchCart();
  }

  Future<bool> _refetchCart() async {
    _loading = true;
    _error = null;
    notifyListeners();

    final result = await _getCart();
    bool ok = false;
    await result.fold(
      (err) async {
        _error = err.message;
        if (_cart.items.isNotEmpty) {
          _showingCachedCart = true;
        }
        if (_cart.items.isEmpty) {
          _restoreCachedCart(errorMessage: err.message);
        }
      },
      (data) async {
        _cart = data;
        _hasLoaded = true;
        _showingCachedCart = false;
        _error = null;
        ok = true;
        await _cache.writeObject<Cart>(
          SPref.CACHE_CART,
          data,
          (cart) => cart.toJson(),
        );
      },
    );

    _loading = false;
    notifyListeners();

    if (ok) {
      if (_cart.items.isEmpty) {
        if (_totals != null || _totalsError != null) {
          _totals = null;
          _totalsError = null;
          notifyListeners();
        }
      } else {
        await loadTotals();
      }
    }
    return ok;
  }

  Future<String?> addItem({
    required String productCode,
    required double amount,
    required int quantity,
  }) async {
    final blockedMessage = _offlineMutationMessage();
    if (blockedMessage != null) return blockedMessage;
    if (_addingItem) return 'Please wait…';
    _addingItem = true;
    notifyListeners();

    String? message;
    final result = await _addItem(
      productCode: productCode,
      amount: amount,
      quantity: quantity,
    );
    await result.fold(
      (err) async => message = err.message,
      (_) async => _refetchCart(),
    );

    _addingItem = false;
    notifyListeners();
    return message;
  }

  Future<String?> setQuantity(CartItem item, int quantity) async {
    final blockedMessage = _offlineMutationMessage();
    if (blockedMessage != null) return blockedMessage;
    if (quantity < 1) return null;
    if (quantity == item.quantity) return null;
    return _updateLine(item, quantity: quantity);
  }

  Future<String?> setAmount(CartItem item, double amount) async {
    final blockedMessage = _offlineMutationMessage();
    if (blockedMessage != null) return blockedMessage;
    if (amount <= 0) return 'Enter a valid amount';
    return _updateLine(item, quantity: item.quantity, amount: amount);
  }

  Future<String?> _updateLine(
    CartItem item, {
    required int quantity,
    double? amount,
  }) async {
    _busyItemIds.add(item.id);
    notifyListeners();

    String? message;
    final result = await _updateItem(
      cartItemId: item.id,
      quantity: quantity,
      amount: amount,
    );
    await result.fold(
      (err) async => message = err.message,
      (_) async => _refetchCart(),
    );

    _busyItemIds.remove(item.id);
    notifyListeners();
    return message;
  }

  Future<String?> removeItem(CartItem item) async {
    final blockedMessage = _offlineMutationMessage();
    if (blockedMessage != null) return blockedMessage;
    _busyItemIds.add(item.id);
    notifyListeners();

    String? message;
    final result = await _removeItem(item.id);
    await result.fold(
      (err) async => message = err.message,
      (_) async => _refetchCart(),
    );

    _busyItemIds.remove(item.id);
    notifyListeners();
    return message;
  }

  Future<String?> clearCart() async {
    final blockedMessage = _offlineMutationMessage();
    if (blockedMessage != null) return blockedMessage;
    if (_cart.items.isEmpty) return null;
    _loading = true;
    notifyListeners();

    String? firstError;
    for (final item in List<CartItem>.from(_cart.items)) {
      final result = await _removeItem(item.id);
      result.fold(
        (err) => firstError ??= err.message,
        (_) {},
      );
    }

    await _refetchCart();
    return firstError;
  }

  Future<bool> loadTotals() async {
    if (_showingCachedCart) {
      _restoreCachedTotals();
      return _totals != null;
    }
    if (_totalsLoading) return false;
    _totalsLoading = true;
    _totalsError = null;
    notifyListeners();

    bool ok = false;
    final result = await _getTotal();
    await result.fold(
      (err) async {
        _totalsError = err.message;
        if (_totals == null) _restoreCachedTotals(errorMessage: err.message);
      },
      (data) async {
        _totals = data;
        _totalsError = null;
        ok = true;
        await _cache.writeObject<CartTotals>(
          SPref.CACHE_CART_TOTALS,
          data,
          (totals) => totals.toJson(),
        );
      },
    );

    _totalsLoading = false;
    notifyListeners();
    return ok;
  }

  void clearTotals() {
    if (_totals == null && _totalsError == null) return;
    _totals = null;
    _totalsError = null;
    notifyListeners();
  }

  String? _offlineMutationMessage() {
    if (!_showingCachedCart) return null;
    return 'Cart changes are unavailable offline. Reconnect and try again.';
  }

  void _restoreCachedCart({String? errorMessage}) {
    final cached = _cache.readObject<Cart>(SPref.CACHE_CART, Cart.fromJson);
    if (cached == null || cached.items.isEmpty) return;
    _cart = cached;
    _hasLoaded = true;
    _showingCachedCart = true;
    if (errorMessage != null) _error = errorMessage;
    _restoreCachedTotals();
  }

  void _restoreCachedTotals({String? errorMessage}) {
    final cached = _cache.readObject<CartTotals>(
      SPref.CACHE_CART_TOTALS,
      CartTotals.fromJson,
    );
    if (cached == null) {
      if (errorMessage != null) _totalsError = errorMessage;
      return;
    }
    _totals = cached;
    _totalsError = errorMessage;
  }
}
