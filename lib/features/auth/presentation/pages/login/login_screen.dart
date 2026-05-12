import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:suregift_test/core/presentation/widgets/app_buttons.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';
import 'package:suregift_test/core/utils/router.dart';
import 'package:suregift_test/features/auth/presentation/state/auth_provider.dart';
import 'package:suregift_test/features/auth/presentation/widgets/auth_brand_header.dart';
import 'package:suregift_test/features/auth/presentation/widgets/auth_field_decoration.dart';
import 'package:suregift_test/features/home/home_shell.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;

    final provider = context.read<AuthenticationProvider>();
    final success = await provider.login(
      _emailController.text.trim(),
      _passwordController.text,
    );
    if (!mounted) return;

    if (success) {
      router.pushAndRemoveUntil(HomeShell(), (route) => false);
      return;
    }

    final message = (provider.error ?? '').isNotEmpty
        ? provider.error!
        : 'Unable to sign in. Please try again.';
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.danger,
      ));
  }

  String? _validateEmail(String? value) {
    final v = value?.trim() ?? '';
    if (v.isEmpty) return 'Enter your email';
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!emailRegex.hasMatch(v)) return 'Enter a valid email';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Enter your password';
    if (value.length < 6) return 'Password is too short';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        context.select<AuthenticationProvider, bool>((p) => p.loading);

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 32),
                      const AuthBrandHeader(),
                      const SizedBox(height: 40),
                      const Text(
                        'Welcome back',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Sign in to browse and purchase gift cards.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 28),
                      TextFormField(
                        controller: _emailController,
                        focusNode: _emailFocus,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        autocorrect: false,
                        enableSuggestions: false,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
                        ],
                        enabled: !isLoading,
                        decoration: authFieldDecoration(
                          label: 'Email',
                          hint: 'you@example.com',
                          icon: Icons.alternate_email,
                        ),
                        validator: _validateEmail,
                        onFieldSubmitted: (_) =>
                            _passwordFocus.requestFocus(),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        focusNode: _passwordFocus,
                        obscureText: _obscurePassword,
                        textInputAction: TextInputAction.done,
                        enabled: !isLoading,
                        decoration: authFieldDecoration(
                          label: 'Password',
                          hint: 'Your password',
                          icon: Icons.lock_outline,
                        ).copyWith(
                          suffixIcon: IconButton(
                            tooltip: _obscurePassword ? 'Show' : 'Hide',
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Colors.grey.shade600,
                            ),
                            onPressed: isLoading
                                ? null
                                : () => setState(() =>
                                    _obscurePassword = !_obscurePassword),
                          ),
                        ),
                        validator: _validatePassword,
                        onFieldSubmitted: (_) => _submit(),
                      ),
                      const SizedBox(height: 28),
                      AppPrimaryButton(
                        label: 'Sign In',
                        loading: isLoading,
                        onPressed: _submit,
                      ),
                      const Spacer(),
                      const SizedBox(height: 16),
                      Center(
                        child: Text(
                          'Test credentials: test@mail.com / Password1@',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
