import 'package:flutter/material.dart';
import 'package:suregift_test/features/products/data/models/product_model.dart';
import 'package:suregift_test/features/products/presentation/widgets/catalog_search_row.dart';
import 'package:suregift_test/features/products/presentation/widgets/product_card.dart'
    show ProductCard, ProductListTile;

class CatalogProductSliver extends StatelessWidget {
  final CatalogView view;
  final List<Product> products;
  final ValueChanged<Product> onTap;

  const CatalogProductSliver({
    super.key,
    required this.view,
    required this.products,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (view == CatalogView.grid) {
      return SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.78,
        ),
        delegate: SliverChildBuilderDelegate(
          (_, index) {
            final product = products[index];
            return ProductCard(
              product: product,
              onTap: () => onTap(product),
            );
          },
          childCount: products.length,
        ),
      );
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, index) {
          final product = products[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ProductListTile(
              product: product,
              onTap: () => onTap(product),
            ),
          );
        },
        childCount: products.length,
      ),
    );
  }
}
