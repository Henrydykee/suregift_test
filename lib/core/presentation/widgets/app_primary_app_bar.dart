import 'package:flutter/material.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';

/// Standard app bar for the in-app screens (catalogue, cart, vouchers, etc.).
///
/// Wraps Material's [AppBar] with the consistent white-on-grey treatment
/// the design calls for, so screens don't keep re-declaring the same
/// background/foreground/elevation triple.
class AppPrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;

  const AppPrimaryAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.centerTitle = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: AppColors.surface,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
      scrolledUnderElevation: 0.5,
      centerTitle: centerTitle,
      leading: leading,
      actions: actions,
    );
  }
}
