import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'core/di/di_config.dart';
import 'core/platform/env_config.dart';
import 'core/platform/string_constants.dart';
import 'core/data/enums/type_enums.dart';
import 'core/presentation/state/provider_initializer.dart';
import 'core/presentation/widgets/app_colors.dart';
import 'core/utils/router.dart';
import 'features/splash/presentation/pages/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvConfig(flavor: Env.STAGING, values: EnvVar(baseUrl: STAGING_BASE_URL));
  await initInjectors();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderInitializer.providers,
      child: MaterialApp(
        navigatorKey: router.navigatorKey,
        debugShowCheckedModeBanner: false,
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
    );
  }
}
