import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'core/data/enums/type_enums.dart';
import 'core/di/di_config.dart';
import 'core/platform/env_config.dart';
import 'core/platform/string_constants.dart';
import 'core/presentation/state/provider_initializer.dart';
import 'core/presentation/widgets/app_colors.dart';
import 'core/utils/router.dart';
import 'features/splash/presentation/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvConfig(
    flavor: Env.STAGING,
    values: EnvVar(baseUrl: STAGING_BASE_URL),
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initInjectors();
  runApp(const VoucherHub());
}

class VoucherHub extends StatelessWidget {
  const VoucherHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderInitializer.providers,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: router.navigatorKey,
          title: 'VoucherHub',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primary,
              primary: AppColors.primary,
              brightness: Brightness.light,
            ),
            scaffoldBackgroundColor: AppColors.background,
            useMaterial3: true,
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
