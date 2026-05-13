import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../data/enums/type_enums.dart';

class EnvVar {
  EnvVar({
    required this.baseUrl,
    required this.encryptionKey,
    required this.encryptionIv,
  });

  final String baseUrl;
  final String encryptionKey;
  final String encryptionIv;
}

class EnvConfig {
  final Env? flavor;
  final EnvVar? values;
  static EnvConfig? _mInstance;

  EnvConfig._internal(this.flavor, this.values);

  factory EnvConfig({required Env flavor, required EnvVar? values}) =>
      _mInstance = EnvConfig._internal(flavor, values);

  static EnvConfig? get instance => _mInstance;

  static bool isProduction() => _mInstance?.flavor == Env.PRODUCTION;
  static bool isStage() => _mInstance?.flavor == Env.STAGING;
  static bool get isStageEnv => String.fromEnvironment('ENV') == "STAGING";

  /// Reads the base URL from .env; falls back to the value set in [EnvVar].
  static String get baseUrl =>
      dotenv.env['BASE_URL'] ?? _mInstance?.values?.baseUrl ?? '';

  /// Reads the AES encryption key from .env.
  static String get encryptionKey =>
      dotenv.env['ENCRYPTION_KEY'] ?? _mInstance?.values?.encryptionKey ?? '';

  /// Reads the AES encryption IV from .env.
  static String get encryptionIv =>
      dotenv.env['ENCRYPTION_IV'] ?? _mInstance?.values?.encryptionIv ?? '';
}
