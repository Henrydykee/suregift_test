import 'package:freezed_annotation/freezed_annotation.dart';

part 'voucher_model.freezed.dart';
part 'voucher_model.g.dart';

enum VoucherStatus { active, expired, unknown }

@freezed
class Voucher with _$Voucher {
  const Voucher._();

  const factory Voucher({
    @JsonKey(fromJson: _intFromAny) @Default(0) int id,
    @JsonKey(fromJson: _intOrNull) int? orderId,
    @Default('') String productCode,
    @Default('') String productName,
    String? productImageUrl,
    @JsonKey(fromJson: _doubleFromAny) @Default(0.0) double amount,
    @Default('NGN') String currency,
    String? voucherCode,
    String? pin,
    String? serialNumber,
    @JsonKey(fromJson: _dateFromAny, toJson: _dateToJson) DateTime? expiryDate,
    String? suregiftsVoucherId,
    String? suregiftsOrderId,
    @JsonKey(fromJson: _dateFromAny, toJson: _dateToJson) DateTime? createdAtUtc,
    String? redemptionUrl,
    String? redemptionInstructions,
    String? termsAndConditions,
  }) = _Voucher;

  factory Voucher.fromJson(Map<String, dynamic> json) =>
      _$VoucherFromJson(json);

  VoucherStatus get status {
    final expiry = expiryDate;
    if (expiry == null) return VoucherStatus.unknown;
    return expiry.isBefore(DateTime.now())
        ? VoucherStatus.expired
        : VoucherStatus.active;
  }

  Voucher mergedWith(Voucher other) => copyWith(
        id: other.id,
        orderId: other.orderId ?? orderId,
        productCode:
            other.productCode.isNotEmpty ? other.productCode : productCode,
        productName:
            other.productName.isNotEmpty ? other.productName : productName,
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

int _intFromAny(Object? raw) {
  if (raw is num) return raw.toInt();
  return int.tryParse(raw?.toString() ?? '') ?? 0;
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

DateTime? _dateFromAny(Object? raw) {
  if (raw == null) return null;
  final str = raw.toString();
  if (str.isEmpty) return null;
  return DateTime.tryParse(str);
}

String? _dateToJson(DateTime? d) => d?.toIso8601String();
