import 'package:flutter/material.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';
import 'package:suregift_test/features/products/data/models/product_model.dart';

class ProductTitleBlock extends StatelessWidget {
  final Product product;
  const ProductTitleBlock({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.name.isEmpty ? product.code : product.name,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            if (product.primaryCountry != null) ...[
              Icon(Icons.public, size: 14, color: Colors.grey.shade600),
              const SizedBox(width: 4),
              Text(
                product.primaryCountry!,
                style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
              ),
              const SizedBox(width: 12),
            ],
            Icon(Icons.payments_outlined,
                size: 14, color: Colors.grey.shade600),
            const SizedBox(width: 4),
            Text(
              product.currency,
              style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
            ),
          ],
        ),
      ],
    );
  }
}
