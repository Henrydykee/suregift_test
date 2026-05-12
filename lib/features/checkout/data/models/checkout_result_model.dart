import 'package:suregift_test/features/vouchers/data/models/voucher_model.dart';

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

CheckoutStatus _parseStatus(dynamic raw) {
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

class CheckoutResult {
  final int? orderId;
  final String? paymentReference;
  final CheckoutStatus status;
  final String rawStatus;
  final double totalAmount;
  final String currency;
  final String? suregiftsOrderId;
  final String? failureReason;
  final List<Voucher> vouchers;

  const CheckoutResult({
    required this.status,
    required this.rawStatus,
    required this.totalAmount,
    required this.currency,
    required this.vouchers,
    this.orderId,
    this.paymentReference,
    this.suregiftsOrderId,
    this.failureReason,
  });

  factory CheckoutResult.fromJson(Map<String, dynamic> json) {
    final amountRaw = json['totalAmount'];
    final total = amountRaw is num
        ? amountRaw.toDouble()
        : double.tryParse(amountRaw?.toString() ?? '') ?? 0.0;

    final vouchersRaw = json['vouchers'];
    final vouchers = vouchersRaw is List
        ? vouchersRaw
            .whereType<Map<String, dynamic>>()
            .map(Voucher.fromJson)
            .toList(growable: false)
        : const <Voucher>[];

    return CheckoutResult(
      orderId: (json['orderId'] as num?)?.toInt(),
      paymentReference: _nonEmpty(json['paymentReference']),
      status: _parseStatus(json['status']),
      rawStatus: json['status']?.toString() ?? '',
      totalAmount: total,
      currency: json['currency']?.toString() ?? 'NGN',
      suregiftsOrderId: _nonEmpty(json['suregiftsOrderId']),
      failureReason: _nonEmpty(json['failureReason']),
      vouchers: vouchers,
    );
  }
}

String? _nonEmpty(dynamic raw) {
  final str = raw?.toString();
  if (str == null || str.isEmpty) return null;
  return str;
}

