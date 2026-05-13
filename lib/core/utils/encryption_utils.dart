import 'package:encrypt/encrypt.dart' as enc;

import '../platform/env_config.dart';

class EncryptionUtils {
  static enc.Encrypter _buildEncrypter() {
    final keyStr = EnvConfig.encryptionKey;

    if (keyStr.isEmpty) {
      throw Exception('ENCRYPTION_KEY not configured in .env');
    }

    // The key stored in .env is Base64-encoded (32 raw bytes → 44-char Base64).
    final key = enc.Key.fromBase64(keyStr);
    return enc.Encrypter(
      enc.AES(key, mode: enc.AESMode.cbc, padding: 'PKCS7'),
    );
  }

  static enc.IV _buildIv() {
    final ivStr = EnvConfig.encryptionIv;
    if (ivStr.isEmpty) {
      throw Exception('ENCRYPTION_IV not configured in .env');
    }
    // The IV stored in .env is Base64-encoded (16 raw bytes → 24-char Base64).
    return enc.IV.fromBase64(ivStr);
  }

  /// Encrypts a plain-text string and returns a Base64-encoded ciphertext.
  static String encrypt(String plainText) {
    try {
      final encrypter = _buildEncrypter();
      final iv = _buildIv();
      return encrypter.encrypt(plainText, iv: iv).base64;
    } catch (e) {
      throw Exception('Failed to encrypt data: $e');
    }
  }

  /// Decrypts a Base64-encoded ciphertext and returns the original plain text.
  static String decrypt(String cipherText) {
    try {
      final encrypter = _buildEncrypter();
      final iv = _buildIv();
      return encrypter.decrypt64(cipherText, iv: iv);
    } catch (e) {
      throw Exception('Failed to decrypt data: $e');
    }
  }

  /// Convenience alias — kept for backward compatibility with password flows.
  static String encryptPassword(String password) => encrypt(password);
}
