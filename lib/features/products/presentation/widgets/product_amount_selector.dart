import 'package:flutter/material.dart';
import 'package:suregift_test/core/presentation/widgets/app_card.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';
import 'package:suregift_test/core/utils/currency_format.dart';
import 'package:suregift_test/core/utils/money_formatter.dart';
import 'package:suregift_test/features/products/data/models/product_model.dart';

class ProductAmountSelector extends StatelessWidget {
  final Product product;
  final double? selectedDenomination;
  final ValueChanged<double> onDenominationSelected;
  final TextEditingController amountController;
  final FocusNode amountFocus;
  final String? amountError;
  final ValueChanged<String> onAmountChanged;

  const ProductAmountSelector({
    super.key,
    required this.product,
    required this.selectedDenomination,
    required this.onDenominationSelected,
    required this.amountController,
    required this.amountFocus,
    required this.amountError,
    required this.onAmountChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AppSectionCard(
      title: product.isOpenAmount ? 'Enter amount' : 'Choose denomination',
      child: product.isOpenAmount
          ? _OpenAmountField(
              product: product,
              controller: amountController,
              focusNode: amountFocus,
              error: amountError,
              onChanged: onAmountChanged,
            )
          : _DenominationGrid(
              product: product,
              selected: selectedDenomination,
              onSelected: onDenominationSelected,
            ),
    );
  }
}

class _OpenAmountField extends StatelessWidget {
  final Product product;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? error;
  final ValueChanged<String> onChanged;

  const _OpenAmountField({
    required this.product,
    required this.controller,
    required this.focusNode,
    required this.error,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final cap = product.effectiveMaxValue;
    final hint = cap == null
        ? 'Minimum ${formatCurrency(product.minValue, product.currency)}'
        : '${formatCurrency(product.minValue, product.currency)} – ${formatCurrency(cap, product.currency)}';

    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [MoneyInputFormatter()],
      onChanged: onChanged,
      textInputAction: TextInputAction.done,
      onSubmitted: (_) => focusNode.unfocus(),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(14, 0, 6, 0),
          child: Text(
            product.currency,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        prefixIconConstraints:
            const BoxConstraints(minWidth: 0, minHeight: 0),
        hintText: hint,
        errorText: error,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }
}

class _DenominationGrid extends StatelessWidget {
  final Product product;
  final double? selected;
  final ValueChanged<double> onSelected;

  const _DenominationGrid({
    required this.product,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final values = [...product.denominations]..sort();
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        for (final v in values)
          ChoiceChip(
            label: Text(formatCurrency(v, product.currency)),
            selected: selected == v,
            onSelected: (_) => onSelected(v),
            labelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: selected == v ? Colors.white : AppColors.textPrimary,
            ),
            selectedColor: AppColors.primary,
            backgroundColor: AppColors.surfaceMuted,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            side: BorderSide(
              color: selected == v ? AppColors.primary : AppColors.border,
            ),
          ),
      ],
    );
  }
}
