import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';
import 'package:suregift_test/features/auth/presentation/state/auth_provider.dart';

class CatalogWelcomeHeader extends StatefulWidget {
  const CatalogWelcomeHeader({super.key});

  @override
  State<CatalogWelcomeHeader> createState() => _CatalogWelcomeHeaderState();
}

class _CatalogWelcomeHeaderState extends State<CatalogWelcomeHeader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _waveController;

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final firstName = context.select<AuthenticationProvider, String>(
      (p) => p.user?.firstName ?? '',
    );
    final name = firstName.isEmpty ? 'there' : firstName;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              'Hi, $name',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
                letterSpacing: -0.3,
              ),
            ),
          ),
          const SizedBox(width: 8),
          AnimatedBuilder(
            animation: _waveController,
            builder: (_, __) {
              final t = Curves.easeInOut.transform(_waveController.value);
              final angle = (t - 0.5) * 0.5;
              return Transform.rotate(
                alignment: Alignment.bottomLeft,
                angle: angle,
                child: const Text('👋', style: TextStyle(fontSize: 26)),
              );
            },
          ),
        ],
      ),
    );
  }
}
