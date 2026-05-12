import 'package:flutter/material.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';
import 'package:suregift_test/core/presentation/widgets/app_network_image.dart';
import 'package:suregift_test/core/utils/currency_format.dart';
import 'package:suregift_test/features/products/data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(16);
    final category = product.primaryCategory;

    return Material(
      color: AppColors.surface,
      borderRadius: radius,
      elevation: 1,
      shadowColor: Colors.black.withValues(alpha: 0.18),
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Container(
              decoration: const BoxDecoration(
                color: AppColors.surfaceMuted,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
              ),
              child: AspectRatio(
                aspectRatio: 16 / 10,
                child: AppNetworkImage(
                  url: product.imageUrl,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  placeholderIconSize: 32,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name.isEmpty ? product.code : product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                        letterSpacing: -0.1,
                        height: 1.2,
                      ),
                    ),
                    if (category != null && category.isNotEmpty) ...[
                      const SizedBox(height: 3),
                      Text(
                        category,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.1,
                        ),
                      ),
                    ],
                    const Spacer(),
                    _PricePill(text: _priceLabel(product)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PricePill extends StatelessWidget {
  final String text;
  const _PricePill({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.primaryTint,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          color: AppColors.primary,
          letterSpacing: 0.1,
        ),
      ),
    );
  }
}

String _priceLabel(Product p) {
  if (p.denominations.isNotEmpty) {
    final sorted = [...p.denominations]..sort();
    if (sorted.length == 1) {
      return formatCurrency(sorted.first, p.currency);
    }
    return '${formatCurrency(sorted.first, p.currency)} – ${formatCurrency(sorted.last, p.currency)}';
  }
  final max = p.effectiveMaxValue;
  if (max == null) return 'From ${formatCurrency(p.minValue, p.currency)}';
  return '${formatCurrency(p.minValue, p.currency)} – ${formatCurrency(max, p.currency)}';
}

class ProductListTile extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductListTile({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(16);
    final category = product.primaryCategory;

    return Material(
      color: AppColors.surface,
      borderRadius: radius,
      elevation: 1,
      shadowColor: Colors.black.withValues(alpha: 0.18),
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: AppColors.surfaceMuted,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: AppNetworkImage(
                  url: product.imageUrl,
                  width: 72,
                  height: 72,
                  borderRadius: BorderRadius.circular(12),
                  placeholderIconSize: 28,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product.name.isEmpty ? product.code : product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                        letterSpacing: -0.1,
                      ),
                    ),
                    if (category != null && category.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        category,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                    const SizedBox(height: 8),
                    _PricePill(text: _priceLabel(product)),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 6, right: 2),
                child: Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

