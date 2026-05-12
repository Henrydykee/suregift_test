import 'package:flutter/material.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';

InputDecoration authFieldDecoration({
  required String label,
  required String hint,
  required IconData icon,
}) {
  final borderColor = Colors.grey.shade300;
  OutlineInputBorder border(Color color, {double width = 1}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: color, width: width),
      );

  return InputDecoration(
    labelText: label,
    hintText: hint,
    prefixIcon: Icon(icon, color: Colors.grey.shade600),
    filled: true,
    fillColor: Colors.grey.shade50,
    labelStyle: TextStyle(color: Colors.grey.shade700),
    hintStyle: TextStyle(color: Colors.grey.shade400),
    contentPadding:
        const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
    border: border(borderColor),
    enabledBorder: border(borderColor),
    focusedBorder: border(AppColors.primaryAccent, width: 1.5),
    errorBorder: border(Colors.red.shade400),
    focusedErrorBorder: border(Colors.red.shade600, width: 1.5),
  );
}
