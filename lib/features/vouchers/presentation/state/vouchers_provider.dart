import 'package:flutter/foundation.dart';
import 'package:suregift_test/features/vouchers/data/models/voucher_model.dart';
import 'package:suregift_test/features/vouchers/domain/usecases/voucher_usecases.dart';

class VouchersProvider extends ChangeNotifier {
  final GetVouchersUseCase _getVouchers;
  final GetVoucherDetailUseCase _getVoucher;

  VouchersProvider({
    required GetVouchersUseCase getVouchers,
    required GetVoucherDetailUseCase getVoucher,
  })  : _getVouchers = getVouchers,
        _getVoucher = getVoucher;

  List<Voucher> _vouchers = const [];
  List<Voucher> get vouchers => _vouchers;
  bool _listLoading = false;
  bool get listLoading => _listLoading;
  String? _listError;
  String? get listError => _listError;
  bool _hasLoadedList = false;
  bool get hasLoadedList => _hasLoadedList;

  Voucher? _selected;
  Voucher? get selected => _selected;
  bool _detailLoading = false;
  bool get detailLoading => _detailLoading;
  String? _detailError;
  String? get detailError => _detailError;

  Future<void> loadVouchers({bool forceRefresh = false}) async {
    if (_listLoading) return;
    if (_hasLoadedList && !forceRefresh && _listError == null) return;

    _listLoading = true;
    _listError = null;
    notifyListeners();

    final result = await _getVouchers();
    result.fold(
      (err) => _listError = err.message,
      (data) {
        _vouchers = data;
        _hasLoadedList = true;
      },
    );

    _listLoading = false;
    notifyListeners();
  }

  Future<void> openVoucher(Voucher seed) async {
    _selected = seed;
    _detailError = null;
    notifyListeners();
    await _loadDetail(seed.id, seed: seed);
  }

  Future<void> refreshSelected() async {
    final current = _selected;
    if (current == null) return;
    await _loadDetail(current.id, seed: current);
  }

  Future<void> _loadDetail(int voucherId, {Voucher? seed}) async {
    _detailLoading = true;
    _detailError = null;
    notifyListeners();

    final result = await _getVoucher(voucherId);
    result.fold(
      (err) => _detailError = err.message,
      (fresh) {
        _selected = seed != null ? seed.mergedWith(fresh) : fresh;
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

