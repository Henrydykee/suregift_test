import 'package:intl/intl.dart';

const Map<String, String> _kCurrencySymbols = {
  'NGN': '₦',
  'USD': r'$',
  'EUR': '€',
  'GBP': '£',
  'KES': 'KSh',
  'GHS': 'GH₵',
  'ZAR': 'R',
};

final NumberFormat _kAmountFmt = NumberFormat('#,##0');
final NumberFormat _kAmountFmtDecimals = NumberFormat('#,##0.00');

/// Format an amount with a currency prefix.
///
/// Falls back to the ISO code (e.g. "AUD 1,000") when no symbol is mapped.
/// Whole numbers render without decimals to match how SureGifts publishes
/// denominations (`1000`, not `1000.00`).
String formatCurrency(num? amount, String currency) {
  final value = amount ?? 0;
  final hasFraction = value != value.truncateToDouble();
  final formatted =
      (hasFraction ? _kAmountFmtDecimals : _kAmountFmt).format(value);

  final symbol = _kCurrencySymbols[currency.toUpperCase()];
  if (symbol != null) return '$symbol$formatted';
  return currency.isEmpty ? formatted : '$currency $formatted';
}
