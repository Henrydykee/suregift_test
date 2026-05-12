import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:suregift_test/core/managers/local_storage_service.dart';

typedef FromJson<T> = T Function(Map<String, dynamic> json);
typedef ToJson<T> = Map<String, dynamic> Function(T value);

class CacheService {
  final LocalStorageService _storage;

  CacheService(this._storage);

  List<T>? readList<T>(String key, FromJson<T> fromJson) {
    final raw = _storage.getString(key);
    if (raw == null || raw.isEmpty) {
      _log('readList MISS  key=$key');
      return null;
    }
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return null;
      final result = decoded
          .whereType<Map<String, dynamic>>()
          .map(fromJson)
          .toList(growable: false);
      _log('readList HIT   key=$key items=${result.length}');
      return result;
    } catch (e) {
      _log('readList ERROR key=$key error=$e');
      _storage.remove(key);
      return null;
    }
  }

  Future<void> writeList<T>(
    String key,
    List<T> items,
    ToJson<T> toJson,
  ) async {
    try {
      final payload = items.map(toJson).toList(growable: false);
      await _storage.setString(key, jsonEncode(payload));
      _log('writeList OK   key=$key items=${items.length}');
    } catch (e) {
      _log('writeList ERROR key=$key error=$e');
    }
  }

  T? readObject<T>(String key, FromJson<T> fromJson) {
    final raw = _storage.getString(key);
    if (raw == null || raw.isEmpty) {
      _log('readObject MISS  key=$key');
      return null;
    }
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map<String, dynamic>) return null;
      _log('readObject HIT   key=$key');
      return fromJson(decoded);
    } catch (e) {
      _log('readObject ERROR key=$key error=$e');
      _storage.remove(key);
      return null;
    }
  }

  Future<void> writeObject<T>(String key, T item, ToJson<T> toJson) async {
    try {
      await _storage.setString(key, jsonEncode(toJson(item)));
      _log('writeObject OK   key=$key');
    } catch (e) {
      _log('writeObject ERROR key=$key error=$e');
    }
  }

  Future<void> remove(String key) => _storage.remove(key);

  void _log(String msg) {
    if (kDebugMode) debugPrint('[Cache] $msg');
  }
}
