import 'package:flutter/material.dart';
import 'package:suregift_test/core/presentation/widgets/app_bullet_line.dart';
import 'package:suregift_test/core/presentation/widgets/app_card.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';
import 'package:suregift_test/core/presentation/widgets/app_error_state.dart';
import 'package:suregift_test/core/presentation/widgets/app_network_image.dart';
import 'package:suregift_test/features/products/data/models/product_model.dart';
import 'package:suregift_test/features/products/presentation/widgets/product_amount_selector.dart';
import 'package:suregift_test/features/products/presentation/widgets/product_meta_badges.dart';
import 'package:suregift_test/features/products/presentation/widgets/product_quantity_row.dart';
import 'package:suregift_test/features/products/presentation/widgets/product_title_block.dart';

class ProductDetailBody extends StatelessWidget {
  final Product product;
  final String? errorMessage;
  final Future<void> Function() onRetry;

  final double? selectedDenomination;
  final ValueChanged<double> onDenominationSelected;
  final TextEditingController amountController;
  final FocusNode amountFocus;
  final String? amountError;
  final ValueChanged<String> onAmountChanged;
  final int quantity;
  final ValueChanged<int> onQuantityChanged;

  const ProductDetailBody({
    super.key,
    required this.product,
    required this.errorMessage,
    required this.onRetry,
    required this.selectedDenomination,
    required this.onDenominationSelected,
    required this.amountController,
    required this.amountFocus,
    required this.amountError,
    required this.onAmountChanged,
    required this.quantity,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRetry,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 140),
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Hero(
                tag: 'product_image_${product.code}',
                child: AppNetworkImage(
                  url: product.imageUrl,
                  placeholderIconSize: 48,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ProductTitleBlock(product: product),
          if (errorMessage != null) ...[
            const SizedBox(height: 12),
            AppInlineError(message: errorMessage!, onRetry: onRetry),
          ],
          const SizedBox(height: 16),
          ProductAmountSelector(
            product: product,
            selectedDenomination: selectedDenomination,
            onDenominationSelected: onDenominationSelected,
            amountController: amountController,
            amountFocus: amountFocus,
            amountError: amountError,
            onAmountChanged: onAmountChanged,
          ),
          const SizedBox(height: 16),
          ProductQuantityRow(quantity: quantity, onChanged: onQuantityChanged),
          const SizedBox(height: 16),
          if (product.description.isNotEmpty)
            AppSectionCard(
              title: 'About',
              child: Text(
                product.description,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.45,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          if (product.redemptionDetails.isNotEmpty) ...[
            const SizedBox(height: 12),
            AppSectionCard(
              title: 'Redemption instructions',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final line in product.redemptionDetails)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: AppBulletLine(text: line),
                    ),
                ],
              ),
            ),
          ],
          if (product.stores.isNotEmpty) ...[
            const SizedBox(height: 12),
            AppSectionCard(
              title: 'Accepted at',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final store in product.stores)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: AppBulletLine(text: store),
                    ),
                ],
              ),
            ),
          ],
          ProductMetaBadges(product: product),
        ],
      ),
    );
  }
}
