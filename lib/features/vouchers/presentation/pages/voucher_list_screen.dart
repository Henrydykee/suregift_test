import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';
import 'package:suregift_test/core/presentation/widgets/app_empty_state.dart';
import 'package:suregift_test/core/presentation/widgets/app_error_state.dart';
import 'package:suregift_test/core/presentation/widgets/app_primary_app_bar.dart';
import 'package:suregift_test/core/presentation/widgets/app_shimmer.dart';
import 'package:suregift_test/features/vouchers/data/models/voucher_model.dart';
import 'package:suregift_test/features/vouchers/presentation/pages/voucher_detail_sheet.dart';
import 'package:suregift_test/features/vouchers/presentation/state/vouchers_provider.dart';
import 'package:suregift_test/features/vouchers/presentation/widgets/voucher_card.dart';

class VoucherListScreen extends StatefulWidget {
  const VoucherListScreen({super.key});

  @override
  State<VoucherListScreen> createState() => _VoucherListScreenState();
}

class _VoucherListScreenState extends State<VoucherListScreen> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<VouchersProvider>().loadVouchers();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _refresh() =>
      context.read<VouchersProvider>().loadVouchers(forceRefresh: true);

  void _openVoucher(Voucher v) => showVoucherDetailSheet(context, v);

  void _clearSearch() {
    _searchController.clear();
    setState(() => _query = '');
  }

  List<Voucher> _filter(List<Voucher> source) {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return source;
    return source.where((v) {
      final name = v.productName.toLowerCase();
      final code = v.productCode.toLowerCase();
      final voucherCode = (v.voucherCode ?? '').toLowerCase();
      return name.contains(q) ||
          code.contains(q) ||
          voucherCode.contains(q);
    }).toList(growable: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const AppPrimaryAppBar(title: 'My Vouchers'),
      body: Consumer<VouchersProvider>(
        builder: (context, provider, _) {
          final isFirstLoad =
              provider.listLoading && provider.vouchers.isEmpty;
          if (isFirstLoad) return const AppShimmerList();

          if (provider.listError != null && provider.vouchers.isEmpty) {
            return AppErrorState(
              title: "Couldn't load vouchers",
              message: provider.listError!,
              onRetry: _refresh,
            );
          }

          if (provider.vouchers.isEmpty) {
            return RefreshIndicator(
              onRefresh: _refresh,
              child: const AppEmptyState(
                icon: Icons.card_giftcard_outlined,
                title: 'No vouchers yet',
                message:
                    'Vouchers from your gift card purchases will appear here.',
              ),
            );
          }

          final filtered = _filter(provider.vouchers);
          final hasQuery = _query.trim().isNotEmpty;

          return Column(
            children: [
              _SearchBar(
                controller: _searchController,
                onChanged: (v) => setState(() => _query = v),
                onClear: _clearSearch,
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _refresh,
                  child: filtered.isEmpty && hasQuery
                      ? ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: [_NoMatchesState(onClear: _clearSearch)],
                        )
                      : ListView.separated(
                          padding:
                              const EdgeInsets.fromLTRB(16, 4, 16, 24),
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: filtered.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 12),
                          itemBuilder: (_, index) {
                            final voucher = filtered[index];
                            return VoucherCard(
                              voucher: voucher,
                              onTap: () => _openVoucher(voucher),
                            );
                          },
                        ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  const _SearchBar({
    required this.controller,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        textInputAction: TextInputAction.search,
        style: const TextStyle(fontSize: 14, color: AppColors.textPrimary),
        decoration: InputDecoration(
          isDense: true,
          hintText: 'Search by product or code',
          hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: AppColors.textMuted,
            size: 22,
          ),
          suffixIcon: controller.text.isEmpty
              ? null
              : IconButton(
                  onPressed: onClear,
                  icon: const Icon(
                    Icons.close_rounded,
                    size: 18,
                    color: AppColors.textMuted,
                  ),
                ),
          filled: true,
          fillColor: AppColors.surface,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: AppColors.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: AppColors.border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide:
                const BorderSide(color: AppColors.primaryAccent, width: 1.4),
          ),
        ),
      ),
    );
  }
}

class _NoMatchesState extends StatelessWidget {
  final VoidCallback onClear;
  const _NoMatchesState({required this.onClear});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 48, 32, 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off_rounded,
              size: 56, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          const Text(
            'No matches',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Try a different product name or voucher code.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primary,
              side: const BorderSide(color: AppColors.primary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: onClear,
            child: const Text('Clear search'),
          ),
        ],
      ),
    );
  }
}

