import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';

/// Standard network image with a built-in placeholder, error fallback, and
/// optional corner rounding. Used by every screen that renders a product or
/// voucher thumbnail so the placeholder treatment stays consistent.
class AppNetworkImage extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final IconData placeholderIcon;
  final double placeholderIconSize;

  const AppNetworkImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholderIcon = Icons.card_giftcard_rounded,
    this.placeholderIconSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    Widget image;
    if (url == null || url!.isEmpty) {
      image = _placeholder();
    } else {
      image = CachedNetworkImage(
        imageUrl: url!,
        width: width,
        height: height,
        fit: fit,
        placeholder: (_, __) => _placeholder(),
        errorWidget: (_, __, ___) => _placeholder(),
      );
    }

    final sized = (width != null || height != null)
        ? SizedBox(width: width, height: height, child: image)
        : image;

    if (borderRadius == null) return sized;
    return ClipRRect(borderRadius: borderRadius!, child: sized);
  }

  Widget _placeholder() => Container(
        width: width,
        height: height,
        color: AppColors.surfaceMuted,
        alignment: Alignment.center,
        child: Icon(
          placeholderIcon,
          color: AppColors.textMuted,
          size: placeholderIconSize,
        ),
      );
}
