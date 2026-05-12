import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';
import 'package:suregift_test/core/presentation/widgets/app_empty_state.dart';
import 'package:suregift_test/core/presentation/widgets/app_error_state.dart';
import 'package:suregift_test/core/presentation/widgets/app_pagination_footer.dart';
import 'package:suregift_test/core/presentation/widgets/app_shimmer.dart';
import 'package:suregift_test/features/products/data/models/product_model.dart';
import 'package:suregift_test/features/products/presentation/pages/product_detail_screen.dart';
import 'package:suregift_test/features/products/presentation/state/products_provider.dart';
import 'package:suregift_test/features/products/presentation/widgets/catalog_category_chips_row.dart';
import 'package:suregift_test/features/products/presentation/widgets/catalog_no_matches_state.dart';
import 'package:suregift_test/features/products/presentation/widgets/catalog_product_sliver.dart';
import 'package:suregift_test/features/products/presentation/widgets/catalog_search_row.dart';
import 'package:suregift_test/features/products/presentation/widgets/catalog_welcome_header.dart';

class ProductCatalogueScreen extends StatefulWidget {
  const ProductCatalogueScreen({super.key});

  @override
  State<ProductCatalogueScreen> createState() => _ProductCatalogueScreenState();
}

class _ProductCatalogueScreenState extends State<ProductCatalogueScreen> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();
  String _searchQuery = '';
  String? _selectedCategory;
  CatalogView _view = CatalogView.grid;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductsProvider>().loadFirstPage();
    });
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final pos = _scrollController.position;
    if (pos.pixels >= pos.maxScrollExtent - 400) {
      context.read<ProductsProvider>().loadNextPage();
    }
  }

  Future<void> _refresh() =>
      context.read<ProductsProvider>().loadFirstPage(forceRefresh: true);

  void _openProduct(Product p) {
    context.read<ProductsProvider>().openProduct(p);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const ProductDetailScreen()),
    );
  }

  void _clearFilters() {
    _searchController.clear();
    setState(() {
      _searchQuery = '';
      _selectedCategory = null;
    });
  }

  List<Product> _applyFilters(List<Product> all) {
    final q = _searchQuery.trim().toLowerCase();
    final cat = _selectedCategory;
    if (q.isEmpty && cat == null) return all;
    return all.where((p) {
      if (cat != null && !p.categories.contains(cat)) return false;
      if (q.isEmpty) return true;
      if (p.name.toLowerCase().contains(q)) return true;
      if (p.description.toLowerCase().contains(q)) return true;
      for (final c in p.categories) {
        if (c.toLowerCase().contains(q)) return true;
      }
      return false;
    }).toList(growable: false);
  }

  List<String> _categoriesOf(List<Product> all) {
    final set = <String>{};
    for (final p in all) {
      for (final c in p.categories) {
        if (c.isNotEmpty) set.add(c);
      }
    }
    return set.toList()..sort();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Consumer<ProductsProvider>(
          builder: (context, provider, _) => _buildContent(context, provider),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, ProductsProvider provider) {
    final isFirstLoad =
        provider.initialLoading && provider.products.isEmpty;
    if (isFirstLoad) {
      return Column(children: const [
        CatalogWelcomeHeader(),
        Expanded(child: AppShimmerGrid()),
      ]);
    }

    if (provider.listError != null && provider.products.isEmpty) {
      return Column(children: [
        const CatalogWelcomeHeader(),
        Expanded(
          child: AppErrorState(
            title: "Couldn't load gift cards",
            message: provider.listError!,
            onRetry: _refresh,
          ),
        ),
      ]);
    }

    if (provider.products.isEmpty) {
      return Column(children: [
        const CatalogWelcomeHeader(),
        Expanded(
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: const AppEmptyState(
              icon: Icons.storefront_outlined,
              title: 'No gift cards available',
              message: 'Pull down to refresh.',
            ),
          ),
        ),
      ]);
    }

    final categories = _categoriesOf(provider.products);
    final visible = _applyFilters(provider.products);
    final isFiltered = _searchQuery.isNotEmpty || _selectedCategory != null;

    return Column(
      children: [
        const CatalogWelcomeHeader(),
        CatalogSearchRow(
          controller: _searchController,
          onChanged: (v) => setState(() => _searchQuery = v),
          onClear: () {
            _searchController.clear();
            setState(() => _searchQuery = '');
          },
          view: _view,
          onToggleView: () => setState(() {
            _view = _view == CatalogView.grid
                ? CatalogView.list
                : CatalogView.grid;
          }),
        ),
        if (categories.isNotEmpty)
          CatalogCategoryChipsRow(
            categories: categories,
            selected: _selectedCategory,
            onSelect: (c) => setState(() => _selectedCategory = c),
          ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: CustomScrollView(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: visible.isEmpty
                  ? [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: CatalogNoMatchesState(
                          clearFilters: isFiltered ? _clearFilters : null,
                        ),
                      ),
                    ]
                  : [
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                        sliver: CatalogProductSliver(
                          view: _view,
                          products: visible,
                          onTap: _openProduct,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: AppPaginationFooter(
                          loading: provider.loadingMore,
                          error: provider.loadingMore
                              ? null
                              : provider.listError,
                          hasReachedEnd: provider.hasReachedEnd,
                          onRetry: () {
                            provider.clearListError();
                            provider.loadNextPage();
                          },
                        ),
                      ),
                    ],
            ),
          ),
        ),
      ],
    );
  }
}
