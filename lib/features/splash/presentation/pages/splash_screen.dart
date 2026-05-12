import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';
import 'package:suregift_test/core/utils/router.dart';
import 'package:suregift_test/features/auth/presentation/pages/login/login_screen.dart';
import 'package:suregift_test/features/auth/presentation/state/auth_provider.dart';
import 'package:suregift_test/features/home/home_shell.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..forward();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);

    WidgetsBinding.instance.addPostFrameCallback((_) => _bootstrap());
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  Future<void> _bootstrap() async {
    final auth = context.read<AuthenticationProvider>();
    final results = await Future.wait([
      auth.restoreSession(),
      Future.delayed(const Duration(milliseconds: 1400)),
    ]);
    if (!mounted) return;
    final restored = results[0] as bool;
    if (restored) {
      router.pushAndRemoveUntil(const HomeShell(), (route) => false);
    } else {
      router.pushAndRemoveUntil(const LoginScreen(), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Center(
          child: FadeTransition(
            opacity: CurvedAnimation(
              parent: _fadeController,
              curve: Curves.easeOut,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _AnimatedLogo(controller: _pulseController),
                const SizedBox(height: 24),
                const Text(
                  'VoucherHub',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Gift cards, simplified',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 36),
                const SizedBox(
                  height: 22,
                  width: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.2,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
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

class _AnimatedLogo extends StatelessWidget {
  final AnimationController controller;
  const _AnimatedLogo({required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        final scale = 0.94 + controller.value * 0.06;
        return Transform.scale(
          scale: scale,
          child: Container(
            height: 96,
            width: 96,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: const Icon(
              Icons.card_giftcard_rounded,
              size: 48,
              color: AppColors.primary,
            ),
          ),
        );
      },
    );
  }
}

