import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_model.freezed.dart';
part 'cart_item_model.g.dart';

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    @JsonKey(fromJson: _intFromAny) @Default(0) int id,
    @Default('') String productCode,
    @Default('') String productName,
    @JsonKey(fromJson: _nonEmpty) String? productImageUrl,
    @JsonKey(fromJson: _doubleFromAny) @Default(0.0) double unitPrice,
    @Default('') String currency,
    @JsonKey(fromJson: _intFromAny) @Default(0) int quantity,
    @JsonKey(fromJson: _doubleFromAny) @Default(0.0) double subtotal,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}

double _doubleFromAny(Object? raw) {
  if (raw is num) return raw.toDouble();
  return double.tryParse(raw?.toString() ?? '') ?? 0.0;
}

int _intFromAny(Object? raw) {
  if (raw is num) return raw.toInt();
  return int.tryParse(raw?.toString() ?? '') ?? 0;
}

String? _nonEmpty(Object? raw) {
  final s = raw?.toString();
  if (s == null || s.isEmpty) return null;
  return s;
}
