enum VoucherStatus { active, expired, unknown }

class Voucher {
  final int id;
  final int? orderId;
  final String productCode;
  final String productName;
  final String? productImageUrl;
  final double amount;
  final String currency;
  final String? voucherCode;
  final String? pin;
  final String? serialNumber;
  final DateTime? expiryDate;
  final String? suregiftsVoucherId;
  final String? suregiftsOrderId;
  final DateTime? createdAtUtc;

  final String? redemptionUrl;
  final String? redemptionInstructions;
  final String? termsAndConditions;

  const Voucher({
    required this.id,
    required this.productCode,
    required this.productName,
    required this.amount,
    required this.currency,
    this.orderId,
    this.productImageUrl,
    this.voucherCode,
    this.pin,
    this.serialNumber,
    this.expiryDate,
    this.suregiftsVoucherId,
    this.suregiftsOrderId,
    this.createdAtUtc,
    this.redemptionUrl,
    this.redemptionInstructions,
    this.termsAndConditions,
  });

  VoucherStatus get status {
    final expiry = expiryDate;
    if (expiry == null) return VoucherStatus.unknown;
    return expiry.isBefore(DateTime.now())
        ? VoucherStatus.expired
        : VoucherStatus.active;
  }

  factory Voucher.fromJson(Map<String, dynamic> json) {
    final amountRaw = json['amount'];
    final amount = amountRaw is num
        ? amountRaw.toDouble()
        : double.tryParse(amountRaw?.toString() ?? '') ?? 0.0;

    return Voucher(
      id: (json['id'] as num).toInt(),
      orderId: (json['orderId'] as num?)?.toInt(),
      productCode: json['productCode']?.toString() ?? '',
      productName: json['productName']?.toString() ?? '',
      productImageUrl: json['productImageUrl']?.toString(),
      amount: amount,
      currency: json['currency']?.toString() ?? 'NGN',
      voucherCode: json['voucherCode']?.toString(),
      pin: json['pin']?.toString(),
      serialNumber: json['serialNumber']?.toString(),
      expiryDate: _parseDate(json['expiryDate']),
      suregiftsVoucherId: json['suregiftsVoucherId']?.toString(),
      suregiftsOrderId: json['suregiftsOrderId']?.toString(),
      createdAtUtc: _parseDate(json['createdAtUtc']),
      redemptionUrl: json['redemptionUrl']?.toString(),
      redemptionInstructions: json['redemptionInstructions']?.toString(),
      termsAndConditions: json['termsAndConditions']?.toString(),
    );
  }

  Voucher mergedWith(Voucher other) => Voucher(
        id: other.id,
        orderId: other.orderId ?? orderId,
        productCode: other.productCode.isNotEmpty ? other.productCode : productCode,
        productName: other.productName.isNotEmpty ? other.productName : productName,
        productImageUrl: other.productImageUrl ?? productImageUrl,
        amount: other.amount,
        currency: other.currency,
        voucherCode: other.voucherCode ?? voucherCode,
        pin: other.pin ?? pin,
        serialNumber: other.serialNumber ?? serialNumber,
        expiryDate: other.expiryDate ?? expiryDate,
        suregiftsVoucherId: other.suregiftsVoucherId ?? suregiftsVoucherId,
        suregiftsOrderId: other.suregiftsOrderId ?? suregiftsOrderId,
        createdAtUtc: other.createdAtUtc ?? createdAtUtc,
        redemptionUrl: other.redemptionUrl ?? redemptionUrl,
        redemptionInstructions:
            other.redemptionInstructions ?? redemptionInstructions,
        termsAndConditions: other.termsAndConditions ?? termsAndConditions,
      );
}

DateTime? _parseDate(dynamic raw) {
  if (raw == null) return null;
  final str = raw.toString();
  if (str.isEmpty) return null;
  return DateTime.tryParse(str);
}

