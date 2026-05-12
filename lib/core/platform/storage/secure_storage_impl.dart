import 'package:suregift_test/core/platform/storage/secured_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class SecuredStorageImpl extends SecuredStorage {
  static final SecuredStorageImpl _singleton =
      SecuredStorageImpl._internal();

  var securedStorage;

  factory SecuredStorageImpl() => _singleton;

  SecuredStorageImpl._internal() {
    securedStorage = const FlutterSecureStorage();
  }

  @override
  Future get({String? key}) async {
    assert(key != null);
    return await securedStorage.read(key: key);
  }

  @override
  Future add({key, value}) async {
    await securedStorage.write(key: key, value: value);
  }

  @override
  Future delete({key}) async {
    await securedStorage.delete(key: key);
  }

  @override
  Future deleteAll() async {
    await securedStorage.deleteAll();
  }
}
