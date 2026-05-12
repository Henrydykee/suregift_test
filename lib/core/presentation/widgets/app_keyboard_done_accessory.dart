import 'package:flutter/material.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';

class AppKeyboardDoneAccessory extends StatelessWidget {
  final VoidCallback onDone;
  const AppKeyboardDoneAccessory({super.key, required this.onDone});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surfaceMuted,
      elevation: 4,
      shadowColor: Colors.black.withValues(alpha: 0.12),
      child: SafeArea(
        top: false,
        child: Container(
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: AppColors.border)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: onDone,
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                child: const Text('Done'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
