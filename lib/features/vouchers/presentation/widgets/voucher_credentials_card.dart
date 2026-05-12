import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:suregift_test/core/presentation/widgets/app_card.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';
import 'package:suregift_test/features/vouchers/data/models/voucher_model.dart';
import 'package:url_launcher/url_launcher.dart';

class VoucherCredentialsCard extends StatelessWidget {
  final Voucher voucher;
  const VoucherCredentialsCard({super.key, required this.voucher});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.lock_outline_rounded,
                  size: 16, color: AppColors.primary),
              const SizedBox(width: 6),
              const Text(
                'Voucher credentials',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const Spacer(),
              Text(
                'Tap to copy',
                style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _CopyableField(
            label: 'Voucher code',
            value: voucher.voucherCode,
            mono: true,
          ),
          if (voucher.pin != null) ...[
            const SizedBox(height: 10),
            _CopyableField(label: 'PIN', value: voucher.pin, mono: true),
          ],
          if (voucher.serialNumber != null) ...[
            const SizedBox(height: 10),
            _CopyableField(
              label: 'Serial number',
              value: voucher.serialNumber,
              mono: true,
            ),
          ],
          if (voucher.suregiftsOrderId != null) ...[
            const SizedBox(height: 10),
            _CopyableField(
              label: 'SureGifts order',
              value: voucher.suregiftsOrderId,
            ),
          ],
          if (voucher.redemptionUrl != null &&
              voucher.redemptionUrl!.isNotEmpty) ...[
            const SizedBox(height: 16),
            _RedeemButton(url: voucher.redemptionUrl!),
          ],
        ],
      ),
    );
  }
}

class _RedeemButton extends StatelessWidget {
  final String url;
  const _RedeemButton({required this.url});

  Future<void> _open(BuildContext context) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return;
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Couldn't open redemption link")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        onPressed: () => _open(context),
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        icon: const Icon(Icons.open_in_new_rounded),
        label: const Text(
          'Redeem online',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
        ),
      ),
    );
  }
}

class _CopyableField extends StatelessWidget {
  final String label;
  final String? value;
  final bool mono;
  const _CopyableField({
    required this.label,
    required this.value,
    this.mono = false,
  });

  Future<void> _copy(BuildContext context, String v, String label) async {
    await Clipboard.setData(ClipboardData(text: v));
    await Fluttertoast.showToast(msg: '$label copied');
  }

  @override
  Widget build(BuildContext context) {
    final v = value ?? '';
    final isEmpty = v.isEmpty;
    return InkWell(
      onTap: isEmpty ? null : () => _copy(context, v, label),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label.toUpperCase(),
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey.shade600,
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isEmpty ? '—' : v,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                      fontFamily: mono ? 'monospace' : null,
                      letterSpacing: mono ? 1.4 : null,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              isEmpty ? Icons.block_rounded : Icons.copy_rounded,
              size: 18,
              color: isEmpty ? AppColors.textMuted : AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
