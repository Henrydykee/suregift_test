import 'package:flutter/material.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';

/// White rounded surface used by list rows and detail-page sections.
///
/// Equivalent to a Material 3 outlined card, but with our consistent
/// border / radius / padding so screens don't keep declaring the same
/// `BoxDecoration` inline.
class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final VoidCallback? onTap;

  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(14),
    this.margin = EdgeInsets.zero,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final shape = BorderRadius.circular(14);
    final decorated = Container(
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: shape,
        border: Border.all(color: AppColors.border),
      ),
      child: child,
    );

    if (onTap == null) {
      return Padding(padding: margin, child: decorated);
    }

    return Padding(
      padding: margin,
      child: Material(
        color: Colors.transparent,
        borderRadius: shape,
        child: InkWell(
          borderRadius: shape,
          onTap: onTap,
          child: decorated,
        ),
      ),
    );
  }
}

/// `AppCard` variant with a section title rendered above [child], used for
/// the "About / Redemption / History" sections on detail screens.
class AppSectionCard extends StatelessWidget {
  final String title;
  final Widget child;
  final EdgeInsetsGeometry padding;

  const AppSectionCard({
    super.key,
    required this.title,
    required this.child,
    this.padding = const EdgeInsets.all(14),
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}
