import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';
import 'package:suregift_test/features/account/presentation/pages/account_tab.dart';
import 'package:suregift_test/features/cart/presentation/pages/cart_screen.dart';
import 'package:suregift_test/features/cart/presentation/state/cart_provider.dart';
import 'package:suregift_test/features/products/presentation/pages/product_catalogue_screen.dart';
import 'package:suregift_test/features/vouchers/presentation/pages/voucher_list_screen.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  static const _tabs = <Widget>[
    ProductCatalogueScreen(),
    VoucherListScreen(),
    CartScreen(),
    AccountTab(),
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CartProvider>().loadCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: IndexedStack(index: _index, children: _tabs),
      bottomNavigationBar: _BottomNav(
        currentIndex: _index,
        onSelect: (i) => setState(() => _index = i),
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onSelect;

  const _BottomNav({required this.currentIndex, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final cartCount = context.select<CartProvider, int>(
      (p) => p.cart.items.fold<int>(0, (sum, i) => sum + i.quantity),
    );

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            children: [
              _NavTab(
                label: 'Catalog',
                icon: Icons.storefront_outlined,
                activeIcon: Icons.storefront_rounded,
                selected: currentIndex == 0,
                onTap: () => onSelect(0),
              ),
              _NavTab(
                label: 'Vouchers',
                icon: Icons.confirmation_number_outlined,
                activeIcon: Icons.confirmation_number_rounded,
                selected: currentIndex == 1,
                onTap: () => onSelect(1),
              ),
              _NavTab(
                label: 'Cart',
                icon: Icons.shopping_cart_outlined,
                activeIcon: Icons.shopping_cart_rounded,
                selected: currentIndex == 2,
                onTap: () => onSelect(2),
                badgeCount: cartCount,
              ),
              _NavTab(
                label: 'Account',
                icon: Icons.person_outline_rounded,
                activeIcon: Icons.person_rounded,
                selected: currentIndex == 3,
                onTap: () => onSelect(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavTab extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconData activeIcon;
  final bool selected;
  final VoidCallback onTap;
  final int badgeCount;

  const _NavTab({
    required this.label,
    required this.icon,
    required this.activeIcon,
    required this.selected,
    required this.onTap,
    this.badgeCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.primary : AppColors.textMuted;
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(selected ? activeIcon : icon, color: color, size: 24),
                  if (badgeCount > 0)
                    Positioned(
                      right: -8,
                      top: -4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.surface,
                            width: 1.5,
                          ),
                        ),
                        constraints: const BoxConstraints(minWidth: 18),
                        child: Text(
                          badgeCount > 99 ? '99+' : '$badgeCount',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            height: 1.1,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

