import 'package:encrypt/encrypt.dart' as enc;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EncryptionUtils {
  /// Encrypts password for backend transmission using AES-CBC + PKCS7.
  /// Returns a Base64-encoded ciphertext string.
  static String encryptPassword(String password) {
    try {
      final keyStr = dotenv.env['VITE_BACKEND_ENCRYPTION_KEY'] ?? '';
      final ivStr = dotenv.env['VITE_BACKEND_ENCRYPTION_IV'] ?? '';

      if (keyStr.isEmpty || ivStr.isEmpty) {
        throw Exception('Encryption key/iv not configured');
      }

      final key = enc.Key.fromUtf8(keyStr);
      final iv = enc.IV.fromUtf8(ivStr);

      final encrypter = enc.Encrypter(
        enc.AES(
          key,
          mode: enc.AESMode.cbc,
          padding: 'PKCS7',
        ),
      );

      final encrypted = encrypter.encrypt(password, iv: iv);

      return encrypted.base64;
    } catch (_) {
      throw Exception('Failed to encrypt password');
    }
  }

  static String encrypt(String plainText) {
    try {
      final keyStr = dotenv.env['VITE_BACKEND_ENCRYPTION_KEY'] ?? '';
      final ivStr = dotenv.env['VITE_BACKEND_ENCRYPTION_IV'] ?? '';

      if (keyStr.isEmpty || ivStr.isEmpty) {
        throw Exception('Encryption key/iv not configured');
      }

      final key = enc.Key.fromUtf8(keyStr);
      final iv = enc.IV.fromUtf8(ivStr);

      final encrypter = enc.Encrypter(
        enc.AES(
          key,
          mode: enc.AESMode.cbc,
          padding: 'PKCS7',
        ),
      );

      final encrypted = encrypter.encrypt(plainText, iv: iv);
      return encrypted.base64;
    } catch (e) {
      throw Exception('Failed to encrypt data: $e');
    }
  }

  static String decrypt(String cipherText) {
    try {
      final keyStr = dotenv.env['VITE_BACKEND_ENCRYPTION_KEY'] ?? '';
      final ivStr = dotenv.env['VITE_BACKEND_ENCRYPTION_IV'] ?? '';

      if (keyStr.isEmpty || ivStr.isEmpty) {
        throw Exception('Encryption key/iv not configured');
      }

      final key = enc.Key.fromUtf8(keyStr);
      final iv = enc.IV.fromUtf8(ivStr);

      final encrypter = enc.Encrypter(
        enc.AES(
          key,
          mode: enc.AESMode.cbc,
          padding: 'PKCS7',
        ),
      );

      final decrypted = encrypter.decrypt64(cipherText, iv: iv);
      return decrypted;
    } catch (e) {
      throw Exception('Failed to decrypt data: $e');
    }
  }
}
