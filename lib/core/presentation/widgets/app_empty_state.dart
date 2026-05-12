import 'package:flutter/material.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';

/// Empty-state for any list/grid screen.
///
/// The widget renders as a scrollable [ListView] when [scrollable] is true so
/// the parent's `RefreshIndicator` still works on an empty page (you can pull
/// to retry). Use the default `scrollable: true` for catalogue / cart /
/// vouchers screens.
class AppEmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? message;
  final bool scrollable;

  const AppEmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.message,
    this.scrollable = true,
  });

  @override
  Widget build(BuildContext context) {
    final content = <Widget>[
      const SizedBox(height: 80),
      Icon(icon, size: 56, color: Colors.grey.shade400),
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
      if (message != null) ...[
        const SizedBox(height: 8),
        Text(
          message!,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
      ],
    ];

    if (scrollable) {
      return ListView(
        padding: const EdgeInsets.all(32),
        physics: const AlwaysScrollableScrollPhysics(),
        children: content,
      );
    }
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(mainAxisSize: MainAxisSize.min, children: content),
      ),
    );
  }
}
