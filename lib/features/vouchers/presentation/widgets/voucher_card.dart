import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';
import 'package:suregift_test/core/presentation/widgets/app_network_image.dart';
import 'package:suregift_test/core/utils/currency_format.dart';
import 'package:suregift_test/features/vouchers/data/models/voucher_model.dart';
import 'package:suregift_test/features/vouchers/presentation/widgets/voucher_status_chip.dart';

class VoucherCard extends StatelessWidget {
  final Voucher voucher;
  final VoidCallback onTap;

  const VoucherCard({super.key, required this.voucher, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(16);
    final expiry = voucher.expiryDate;

    return Material(
      color: AppColors.surface,
      borderRadius: radius,
      elevation: 1,
      shadowColor: Colors.black.withValues(alpha: 0.18),
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: ClipRRect(
          borderRadius: radius,
          child: IntrinsicHeight(
            child: Row(
              children: [

                Container(
                  width: 92,
                  color: AppColors.surfaceMuted,
                  alignment: Alignment.center,
                  child: Hero(
                    tag: 'voucher_image_${voucher.id}',
                    child: AppNetworkImage(
                      url: voucher.productImageUrl,
                      width: 64,
                      height: 64,
                      borderRadius: BorderRadius.circular(10),
                      placeholderIconSize: 28,
                    ),
                  ),
                ),
                _NotchDivider(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(14, 14, 12, 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                voucher.productName.isEmpty
                                    ? voucher.productCode
                                    : voucher.productName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimary,
                                  letterSpacing: -0.1,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            VoucherStatusChip(status: voucher.status),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          formatCurrency(voucher.amount, voucher.currency),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primary,
                            letterSpacing: -0.2,
                          ),
                        ),
                        if (expiry != null) ...[
                          const SizedBox(height: 8),
                          _MetaLine(
                            icon: Icons.event_outlined,
                            label: 'Expires ${_formatDate(expiry)}',
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.chevron_right_rounded,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NotchDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 12,
      child: CustomPaint(
        painter: _DashedLinePainter(),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.border
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    const dashLength = 4.0;
    const gapLength = 4.0;
    double y = 6;
    final x = size.width / 2;
    while (y < size.height - 4) {
      canvas.drawLine(Offset(x, y), Offset(x, y + dashLength), paint);
      y += dashLength + gapLength;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _MetaLine extends StatelessWidget {
  final IconData icon;
  final String label;
  const _MetaLine({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 13, color: Colors.grey.shade600),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

String _formatDate(DateTime d) => DateFormat('d MMM yyyy').format(d.toLocal());

