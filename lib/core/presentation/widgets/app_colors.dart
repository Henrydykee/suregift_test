import 'package:flutter/material.dart';

/// Centralised brand palette so screens don't keep redeclaring hex constants.
///
/// Keep colour decisions here — adjusting the primary should fan out to every
/// button, app bar, and chip without touching screen files.
class AppColors {
  AppColors._();

  // Brand — SureGifts red / black / white
  static const Color primary = Color(0xFFC8102E);
  static const Color primaryAccent = Color(0xFFE63946);
  static const Color primaryDark = Color(0xFF8B0000);
  static const Color primaryTint = Color(0xFFFDECEC);

  // Surfaces
  static const Color background = Color(0xFFFAFAFA);
  static const Color surface = Colors.white;
  static const Color surfaceMuted = Color(0xFFF3F4F6);
  static const Color border = Color(0xFFE5E7EB);

  // Text (near-black)
  static const Color textPrimary = Color(0xFF0F0F0F);
  static const Color textSecondary = Color(0xFF4B5563);
  static const Color textMuted = Color(0xFF9CA3AF);

  // Status
  static const Color success = Color(0xFF16A34A);
  static const Color successBg = Color(0xFFDCFCE7);
  static const Color danger = Color(0xFFB91C1C);
  static const Color dangerBg = Color(0xFFFEF2F2);
}
