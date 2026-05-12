import 'package:flutter/material.dart';
import 'package:suregift_test/features/vouchers/data/models/voucher_model.dart';

class VoucherStatusChip extends StatelessWidget {
  final VoucherStatus status;

  const VoucherStatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final (label, bg, fg) = switch (status) {
      VoucherStatus.active => ('Active', const Color(0xFFE6F4EA), const Color(0xFF137333)),
      VoucherStatus.expired => ('Expired', const Color(0xFFFDECEA), const Color(0xFFC5221F)),
      VoucherStatus.unknown => ('—', const Color(0xFFF1F3F4), const Color(0xFF5F6368)),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: fg,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}

