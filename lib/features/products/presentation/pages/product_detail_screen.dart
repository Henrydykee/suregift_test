import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';
import 'package:suregift_test/core/presentation/widgets/app_keyboard_done_accessory.dart';
import 'package:suregift_test/core/presentation/widgets/app_primary_app_bar.dart';
import 'package:suregift_test/core/utils/currency_format.dart';
import 'package:suregift_test/core/utils/money_formatter.dart';
import 'package:suregift_test/features/cart/presentation/state/cart_provider.dart';
import 'package:suregift_test/features/products/data/models/product_model.dart';
import 'package:suregift_test/features/products/presentation/state/products_provider.dart';
import 'package:suregift_test/features/products/presentation/widgets/product_add_to_cart_bar.dart';
import 'package:suregift_test/features/products/presentation/widgets/product_detail_body.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const AppPrimaryAppBar(title: 'Product details'),
      body: Consumer<ProductsProvider>(
        builder: (context, provider, _) {
          final product = provider.selected;
          if (product == null) return const _EmptySelection();
          return _ProductDetailScaffold(
            product: product,
            errorMessage: provider.detailError,
            onRetry: provider.refreshSelected,
          );
        },
      ),
    );
  }
}

class _EmptySelection extends StatelessWidget {
  const _EmptySelection();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Text(
          'No product selected.',
          style: TextStyle(color: Colors.grey.shade600),
        ),
      ),
    );
  }
}

class _ProductDetailScaffold extends StatefulWidget {
  final Product product;
  final String? errorMessage;
  final Future<void> Function() onRetry;

  const _ProductDetailScaffold({
    required this.product,
    required this.errorMessage,
    required this.onRetry,
  });

  @override
  State<_ProductDetailScaffold> createState() => _ProductDetailScaffoldState();
}

class _ProductDetailScaffoldState extends State<_ProductDetailScaffold> {
  double? _selectedDenomination;
  final TextEditingController _amountController = TextEditingController();
  final FocusNode _amountFocus = FocusNode();
  int _quantity = 1;
  String? _amountError;
  bool _amountFocused = false;

  @override
  void initState() {
    super.initState();
    _amountFocus.addListener(_onAmountFocusChange);
  }

  void _onAmountFocusChange() {
    if (!mounted) return;
    final next = _amountFocus.hasFocus;
    if (next != _amountFocused) {
      setState(() => _amountFocused = next);
    }
  }

  @override
  void didUpdateWidget(covariant _ProductDetailScaffold old) {
    super.didUpdateWidget(old);
    if (old.product.code != widget.product.code) {
      _selectedDenomination = null;
      _amountController.clear();
      _quantity = 1;
      _amountError = null;
    }
  }

  @override
  void dispose() {
    _amountFocus.removeListener(_onAmountFocusChange);
    _amountController.dispose();
    _amountFocus.dispose();
    super.dispose();
  }

  double? get _amountFromInput {
    final raw = _amountController.text.trim();
    if (raw.isEmpty) return null;
    return Money.parse(raw);
  }

  double? get _resolvedAmount {
    if (widget.product.isOpenAmount) return _amountFromInput;
    return _selectedDenomination;
  }

  double? get _totalAmount =>
      _resolvedAmount == null ? null : _resolvedAmount! * _quantity;

  String? _amountRangeError() {
    final product = widget.product;
    if (!product.isOpenAmount) return null;
    final value = _amountFromInput;
    if (value == null) return null;
    if (value <= 0) return 'Enter a valid amount';
    if (value < product.minValue) {
      return 'Minimum amount is ${formatCurrency(product.minValue, product.currency)}';
    }
    final cap = product.effectiveMaxValue;
    if (cap != null && value > cap) {
      return 'Maximum amount is ${formatCurrency(cap, product.currency)}';
    }
    return null;
  }

  void _liveValidateAmount() {
    final next = _amountRangeError();
    if (next != _amountError) {
      setState(() => _amountError = next);
    }
  }

  bool _validateAmount() {
    final product = widget.product;
    if (product.isOpenAmount) {
      final value = _amountFromInput;
      if (value == null) {
        setState(() => _amountError = 'Enter an amount');
        return false;
      }
      final rangeError = _amountRangeError();
      if (rangeError != null) {
        setState(() => _amountError = rangeError);
        return false;
      }
    } else if (_selectedDenomination == null) {
      Fluttertoast.showToast(msg: 'Pick a denomination');
      return false;
    }

    setState(() => _amountError = null);
    return true;
  }

  Future<void> _onAddToCart() async {
    FocusScope.of(context).unfocus();
    if (!_validateAmount()) return;

    final cart = context.read<CartProvider>();
    if (cart.addingItem) return;

    final product = widget.product;
    final amount = _resolvedAmount!;
    final qty = _quantity;

    final error = await cart.addItem(
      productCode: product.code,
      amount: amount,
      quantity: qty,
    );
    if (!mounted) return;

    if (error != null) {
      Fluttertoast.showToast(msg: error, toastLength: Toast.LENGTH_LONG);
      return;
    }
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    Fluttertoast.showToast(
      msg:
          'Added $qty × ${formatCurrency(amount, product.currency)} ${product.name}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ProductDetailBody(
            product: widget.product,
            errorMessage: widget.errorMessage,
            onRetry: widget.onRetry,
            selectedDenomination: _selectedDenomination,
            onDenominationSelected: (v) =>
                setState(() => _selectedDenomination = v),
            amountController: _amountController,
            amountFocus: _amountFocus,
            amountError: _amountError,
            onAmountChanged: (_) => _liveValidateAmount(),
            quantity: _quantity,
            onQuantityChanged: (q) => setState(() => _quantity = q),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: _amountFocused
              ? AppKeyboardDoneAccessory(onDone: _amountFocus.unfocus)
              : ProductAddToCartBar(
                  total: _totalAmount,
                  currency: widget.product.currency,
                  onAdd: _onAddToCart,
                ),
        ),
      ],
    );
  }
}
