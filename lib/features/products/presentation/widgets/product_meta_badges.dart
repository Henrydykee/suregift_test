import 'package:flutter/material.dart';
import 'package:suregift_test/core/presentation/widgets/app_meta_chip.dart';
import 'package:suregift_test/features/products/data/models/product_model.dart';

class ProductMetaBadges extends StatelessWidget {
  final Product product;
  const ProductMetaBadges({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final chips = <Widget>[];
    final validity = product.validity;
    if (validity != null) {
      chips.add(AppMetaChip(
        icon: Icons.schedule_rounded,
        label: 'Valid for ${validity.label}',
      ));
    }
    for (final c in product.categories) {
      chips.add(AppMetaChip(icon: Icons.category_outlined, label: c));
    }
    for (final c in product.countries) {
      chips.add(AppMetaChip(icon: Icons.flag_outlined, label: c));
    }

    if (chips.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Wrap(spacing: 8, runSpacing: 8, children: chips),
    );
  }
}
