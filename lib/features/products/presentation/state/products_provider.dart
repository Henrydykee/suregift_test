import 'package:flutter/foundation.dart';
import 'package:suregift_test/features/products/data/models/product_model.dart';
import 'package:suregift_test/features/products/domain/usecases/product_usecases.dart';

class ProductsProvider extends ChangeNotifier {
  final GetProductsUseCase _getProducts;
  final GetProductDetailUseCase _getProductDetail;

  static const int _pageSize = 50;

  ProductsProvider({
    required GetProductsUseCase getProducts,
    required GetProductDetailUseCase getProductDetail,
  })  : _getProducts = getProducts,
        _getProductDetail = getProductDetail;

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

  Future<void> loadFirstPage({bool forceRefresh = false}) async {
    if (_initialLoading) return;
    if (_hasLoadedList && !forceRefresh && _listError == null) return;

    _initialLoading = true;
    _listError = null;
    _hasReachedEnd = false;
    if (forceRefresh) _products.clear();
    notifyListeners();

    final result = await _getProducts(limit: _pageSize, skip: 0);
    result.fold(
      (err) => _listError = err.message,
      (page) {
        _products
          ..clear()
          ..addAll(page);
        _hasReachedEnd = page.length < _pageSize;
        _hasLoadedList = true;
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
    result.fold(
      (err) => _detailError = err.message,
      (fresh) => _selected = fresh,
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

