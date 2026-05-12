import 'package:flutter/material.dart';
import 'package:suregift_test/core/presentation/widgets/app_buttons.dart';
import 'package:suregift_test/features/checkout/data/models/checkout_result_model.dart';
import 'package:suregift_test/features/vouchers/presentation/pages/voucher_list_screen.dart';

class CheckoutResultActions extends StatelessWidget {
  final CheckoutResult result;
  const CheckoutResultActions({super.key, required this.result});

  void _goHome(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  void _goToVouchers(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const VoucherListScreen()),
      (route) => route.isFirst,
    );
  }

  @override
  Widget build(BuildContext context) {
    final status = result.status;
    if (status.isTerminalSuccess) {
      return _ActionsColumn(
        primaryLabel: 'View my vouchers',
        primaryIcon: Icons.confirmation_number_outlined,
        onPrimary: () => _goToVouchers(context),
        onSecondary: () => _goHome(context),
      );
    }
    if (status.isTerminalFailure) {
      return _ActionsColumn(
        primaryLabel: 'Back to cart',
        onPrimary: () => Navigator.of(context).pop(),
        onSecondary: () => _goHome(context),
      );
    }
    return _ActionsColumn(
      primaryLabel: 'Check vouchers later',
      primaryIcon: Icons.history_rounded,
      onPrimary: () => _goToVouchers(context),
      onSecondary: () => _goHome(context),
    );
  }
}

class _ActionsColumn extends StatelessWidget {
  final String primaryLabel;
  final IconData? primaryIcon;
  final VoidCallback onPrimary;
  final VoidCallback onSecondary;

  const _ActionsColumn({
    required this.primaryLabel,
    this.primaryIcon,
    required this.onPrimary,
    required this.onSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppPrimaryButton(
          label: primaryLabel,
          icon: primaryIcon,
          onPressed: onPrimary,
        ),
        const SizedBox(height: 10),
        AppOutlineButton(label: 'Back to home', onPressed: onSecondary),
      ],
    );
  }
}
