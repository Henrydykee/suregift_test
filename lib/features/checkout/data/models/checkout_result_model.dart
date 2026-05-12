import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:suregift_test/features/vouchers/data/models/voucher_model.dart';

part 'checkout_result_model.freezed.dart';
part 'checkout_result_model.g.dart';

enum CheckoutStatus {
  pending,
  paymentSuccessful,
  purchaseProcessing,
  purchaseSuccessful,
  purchaseFailed,
  unknown,
}

extension CheckoutStatusX on CheckoutStatus {
  bool get isTerminalSuccess => this == CheckoutStatus.purchaseSuccessful;
  bool get isTerminalFailure => this == CheckoutStatus.purchaseFailed;
  bool get isProcessing =>
      this == CheckoutStatus.pending ||
      this == CheckoutStatus.paymentSuccessful ||
      this == CheckoutStatus.purchaseProcessing;
}

@freezed
class CheckoutResult with _$CheckoutResult {
  const CheckoutResult._();

  const factory CheckoutResult({
    @JsonKey(fromJson: _intOrNull) int? orderId,
    @JsonKey(fromJson: _nonEmpty) String? paymentReference,
    @JsonKey(fromJson: _parseStatus, toJson: _statusToJson)
    @Default(CheckoutStatus.unknown)
    CheckoutStatus status,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default('')
    String rawStatus,
    @JsonKey(fromJson: _doubleFromAny) @Default(0.0) double totalAmount,
    @Default('NGN') String currency,
    @JsonKey(fromJson: _nonEmpty) String? suregiftsOrderId,
    @JsonKey(fromJson: _nonEmpty) String? failureReason,
    @JsonKey(fromJson: _vouchersFromJson)
    @Default(<Voucher>[])
    List<Voucher> vouchers,
  }) = _CheckoutResult;

  factory CheckoutResult.fromJson(Map<String, dynamic> json) =>
      _$CheckoutResultFromJson(json);

  static CheckoutResult parse(Map<String, dynamic> json) {
    final base = CheckoutResult.fromJson(json);
    final raw = json['status']?.toString() ?? '';
    if (raw == base.rawStatus) return base;
    return base.copyWith(rawStatus: raw);
  }
}

int? _intOrNull(Object? raw) {
  if (raw == null) return null;
  if (raw is num) return raw.toInt();
  return int.tryParse(raw.toString());
}

double _doubleFromAny(Object? raw) {
  if (raw is num) return raw.toDouble();
  return double.tryParse(raw?.toString() ?? '') ?? 0.0;
}

String? _nonEmpty(Object? raw) {
  final s = raw?.toString();
  if (s == null || s.isEmpty) return null;
  return s;
}

CheckoutStatus _parseStatus(Object? raw) {
  final normalized =
      (raw?.toString() ?? '').replaceAll(RegExp(r'[\s_-]'), '').toLowerCase();
  switch (normalized) {
    case 'pending':
      return CheckoutStatus.pending;
    case 'paymentsuccessful':
    case 'paymentsuccess':
      return CheckoutStatus.paymentSuccessful;
    case 'purchaseprocessing':
    case 'processing':
      return CheckoutStatus.purchaseProcessing;
    case 'purchasesuccessful':
    case 'purchasesuccess':
    case 'success':
    case 'successful':
      return CheckoutStatus.purchaseSuccessful;
    case 'purchasefailed':
    case 'failed':
    case 'failure':
      return CheckoutStatus.purchaseFailed;
    default:
      return CheckoutStatus.unknown;
  }
}

String _statusToJson(CheckoutStatus status) => status.name;

List<Voucher> _vouchersFromJson(Object? raw) {
  if (raw is! List) return const <Voucher>[];
  return raw
      .whereType<Map<String, dynamic>>()
      .map(Voucher.fromJson)
      .toList(growable: false);
}
