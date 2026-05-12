import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

const String kNairaSymbol = '₦';

class Money {
  Money._();

  static final NumberFormat _withDecimals = NumberFormat('#,##0.00');
  static final NumberFormat _noDecimals = NumberFormat('#,##0');

  /// "₦1,234,567.89"
  static String format(num? value, {bool decimals = true}) {
    final v = value ?? 0;
    final fmt = decimals ? _withDecimals : _noDecimals;
    return '$kNairaSymbol${fmt.format(v)}';
  }

  /// "1,234,567.89" — no currency symbol.
  static String formatPlain(num? value, {bool decimals = true}) {
    final v = value ?? 0;
    return (decimals ? _withDecimals : _noDecimals).format(v);
  }

  /// "₦1.23M", "₦4.56B" — for large values (market cap, totals).
  static String formatCompact(num? value, {bool withSymbol = true}) {
    if (value == null) return withSymbol ? '$kNairaSymbol—' : '—';
    final symbol = withSymbol ? kNairaSymbol : '';
    final abs = value.abs();
    if (abs >= 1e12) return '$symbol${(value / 1e12).toStringAsFixed(2)}T';
    if (abs >= 1e9) return '$symbol${(value / 1e9).toStringAsFixed(2)}B';
    if (abs >= 1e6) return '$symbol${(value / 1e6).toStringAsFixed(2)}M';
    if (abs >= 1e3) return '$symbol${(value / 1e3).toStringAsFixed(1)}K';
    return '$symbol${value.toStringAsFixed(withSymbol ? 2 : 0)}';
  }

  /// "+₦1,234.00" / "-₦1,234.00" — signed amount with currency.
  static String formatSigned(num? value, {bool decimals = true}) {
    final v = value ?? 0;
    final sign = v > 0 ? '+' : (v < 0 ? '-' : '');
    return '$sign${format(v.abs(), decimals: decimals)}';
  }

  /// Strip commas/symbol from a user-typed amount and parse to double.
  static double parse(String? text) {
    if (text == null) return 0;
    final cleaned = text.replaceAll(RegExp(r'[^0-9.]'), '');
    if (cleaned.isEmpty) return 0;
    return double.tryParse(cleaned) ?? 0;
  }
}

/// Formats a numeric text field as the user types: "1234567.8" -> "1,234,567.8".
/// Allows up to two decimal places. Strips leading zeros.
class MoneyInputFormatter extends TextInputFormatter {
  final int maxDecimals;

  MoneyInputFormatter({this.maxDecimals = 2});

  static final NumberFormat _intFmt = NumberFormat('#,##0');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final raw = newValue.text;
    if (raw.isEmpty) return newValue;

    // Keep only digits and a single dot.
    var cleaned = raw.replaceAll(RegExp(r'[^0-9.]'), '');
    final firstDot = cleaned.indexOf('.');
    if (firstDot != -1) {
      final before = cleaned.substring(0, firstDot);
      final after = cleaned.substring(firstDot + 1).replaceAll('.', '');
      cleaned = '$before.$after';
    }

    final hasDot = cleaned.contains('.');
    String intPart = hasDot ? cleaned.split('.').first : cleaned;
    String decPart = hasDot ? cleaned.split('.').last : '';

    intPart = intPart.replaceFirst(RegExp(r'^0+(?=\d)'), '');
    if (intPart.isEmpty) intPart = '0';

    if (decPart.length > maxDecimals) {
      decPart = decPart.substring(0, maxDecimals);
    }

    final intValue = int.tryParse(intPart) ?? 0;
    final formattedInt = _intFmt.format(intValue);
    final formatted = hasDot ? '$formattedInt.$decPart' : formattedInt;

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
