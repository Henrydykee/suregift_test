import 'package:flutter/material.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';

/// Full-page error view with retry CTA — used when the first network call
/// for a screen fails and there's nothing to fall back to.
class AppErrorState extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;
  final Future<void> Function() onRetry;
  final String retryLabel;

  const AppErrorState({
    super.key,
    required this.message,
    required this.onRetry,
    this.title = "Something went wrong",
    this.icon = Icons.cloud_off_rounded,
    this.retryLabel = 'Try again',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 56, color: Colors.grey.shade500),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 20),
            FilledButton.tonalIcon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: Text(retryLabel),
            ),
          ],
        ),
      ),
    );
  }
}

/// Compact inline error used inside a card/section (e.g. operations history
/// failing on the voucher detail page). Provides a one-tap retry.
class AppInlineError extends StatelessWidget {
  final String message;
  final Future<void> Function() onRetry;

  const AppInlineError({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.dangerBg,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline_rounded, color: AppColors.danger),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(fontSize: 13, color: AppColors.danger),
            ),
          ),
          TextButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}
