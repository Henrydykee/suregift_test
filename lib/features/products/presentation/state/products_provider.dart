import 'package:flutter/foundation.dart';
import 'package:suregift_test/core/data/cache/cache_service.dart';
import 'package:suregift_test/core/platform/string_constants.dart';
import 'package:suregift_test/features/products/data/models/product_model.dart';
import 'package:suregift_test/features/products/domain/usecases/product_usecases.dart';

class ProductsProvider extends ChangeNotifier {
  final GetProductsUseCase _getProducts;
  final GetProductDetailUseCase _getProductDetail;
  final CacheService _cache;

  static const int _pageSize = 50;

  ProductsProvider({
    required GetProductsUseCase getProducts,
    required GetProductDetailUseCase getProductDetail,
    required CacheService cache,
  })  : _getProducts = getProducts,
        _getProductDetail = getProductDetail,
        _cache = cache;

  final List<Product> _products = <Product>[];
  List<Product> get products => List.unmodifiable(_products);

  bool _initialLoading = false;
  bool get initialLoading => _initialLoading;

  bool _loadingMore = false;
  bool get loadingMore => _loadingMore;

  String? _listError;
  String? get listError => _listError;

  bool _hasReachedEnd = false;
  bool get hasReachedEnd => _hasReachedEnd;

  bool _hasLoadedList = false;
  bool get hasLoadedList => _hasLoadedList;

  Product? _selected;
  Product? get selected => _selected;

  bool _detailLoading = false;
  bool get detailLoading => _detailLoading;

  String? _detailError;
  String? get detailError => _detailError;

  String _detailCacheKey(String code) =>
      '${SPref.CACHE_PRODUCT_DETAIL_PREFIX}$code';

  Future<void> loadFirstPage({bool forceRefresh = false}) async {
    if (_initialLoading) return;
    if (_hasLoadedList && !forceRefresh && _listError == null) return;

    if (_products.isEmpty) {
      final cached = _cache.readList<Product>(
        SPref.CACHE_PRODUCTS_LIST,
        Product.fromJson,
      );
      if (cached != null && cached.isNotEmpty) {
        _products
          ..clear()
          ..addAll(cached);
        _hasLoadedList = true;
        notifyListeners();
      }
    }

    _initialLoading = true;
    _listError = null;
    notifyListeners();

    final result = await _getProducts(limit: _pageSize, skip: 0);
    await result.fold(
      (err) async => _listError = err.message,
      (page) async {
        _products
          ..clear()
          ..addAll(page);
        _hasReachedEnd = page.length < _pageSize;
        _hasLoadedList = true;
        await _cache.writeList<Product>(
          SPref.CACHE_PRODUCTS_LIST,
          page,
          (p) => p.toJson(),
        );
      },
    );

    _initialLoading = false;
    notifyListeners();
  }

  Future<void> loadNextPage() async {
    if (_initialLoading || _loadingMore || _hasReachedEnd) return;
    if (_products.isEmpty) {
      await loadFirstPage();
      return;
    }

    _loadingMore = true;
    notifyListeners();

    final result =
        await _getProducts(limit: _pageSize, skip: _products.length);
    result.fold(
      (err) {
        _listError = err.message;
      },
      (page) {
        if (page.isEmpty) {
          _hasReachedEnd = true;
        } else {
          _products.addAll(page);
          if (page.length < _pageSize) _hasReachedEnd = true;
        }
      },
    );

    _loadingMore = false;
    notifyListeners();
  }

  void clearListError() {
    if (_listError == null) return;
    _listError = null;
    notifyListeners();
  }

  Future<void> openProduct(Product seed) async {
    _selected = seed;
    _detailError = null;

    final cached = _cache.readObject<Product>(
      _detailCacheKey(seed.code),
      Product.fromJson,
    );
    if (cached != null) _selected = cached;
    notifyListeners();

    await _refetchDetail(seed.code);
  }

  Future<void> refreshSelected() async {
    final current = _selected;
    if (current == null) return;
    await _refetchDetail(current.code);
  }

  Future<void> _refetchDetail(String code) async {
    _detailLoading = true;
    _detailError = null;
    notifyListeners();

    final result = await _getProductDetail(code);
    await result.fold(
      (err) async => _detailError = err.message,
      (fresh) async {
        _selected = fresh;
        await _cache.writeObject<Product>(
          _detailCacheKey(code),
          fresh,
          (p) => p.toJson(),
        );
      },
    );

    _detailLoading = false;
    notifyListeners();
  }

  void clearSelection() {
    _selected = null;
    _detailError = null;
    _detailLoading = false;
  }
}
