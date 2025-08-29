import 'dart:convert';

import 'package:fanboost_mobile/core/services/di/dependency_injector.dart';
import 'package:fanboost_mobile/shared/constants/app_map_keys.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CachedService {
  Future<void> cacheUserData(User? userData);
  Future<User?> getCacheUserData();
  Future<void> cacheToken(String token);
  Future<void> clearCacheToken();
  Future<void> cacheRefreshToken(String refreshToken);
  Future<void> cacheIDToken(String token);
  Future<void> cacheString(String key, String value);
  Future<String?> getString(String key);
  Future<String?> getToken();
  Future<String?> getIdToken();
  Future<String?> getRefreshToken();
  Future<void> clearCache();
}

//? Currently not used. storing credentials are done by supabase.
class CachedServiceImpl implements CachedService {
  final FlutterSecureStorage securePref = locator<FlutterSecureStorage>();

  @override
  Future<void> clearCache() async {
    await securePref.deleteAll();
  }

  @override
  Future<void> cacheUserData(User? userData) async {
    await securePref.write(
      key: KCacheKeys.user,
      value: json.encode(userData),
    );
  }

  @override
  Future<User?> getCacheUserData() async {
    try {
      final res =
          json.decode(await securePref.read(key: KCacheKeys.user) ?? '');
      if (res is! Map<String, dynamic>) return null;
      return User.fromJson(res);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> cacheToken(String token) async {
    await securePref.write(key: KCacheKeys.accessToken, value: token);
  }

  @override
  Future<void> cacheIDToken(String token) async {
    await securePref.write(key: KCacheKeys.idToken, value: token);
  }

  @override
  Future<String?> getIdToken() async {
    return securePref.read(key: KCacheKeys.idToken);
  }

  @override
  Future<String?> getToken() async {
    return securePref.read(key: KCacheKeys.accessToken);
  }

  @override
  Future<void> cacheRefreshToken(String refreshToken) async {
    await securePref.write(key: KCacheKeys.refreshToken, value: refreshToken);
  }

  @override
  Future<String?> getRefreshToken() async {
    return securePref.read(key: KCacheKeys.refreshToken);
  }

  @override
  Future<void> cacheString(String key, String value) async {
    await securePref.write(key: key, value: value);
  }

  @override
  Future<String?> getString(String key) async {
    return securePref.read(key: key);
  }

  @override
  Future<void> clearCacheToken() async {
    await securePref.delete(key: KCacheKeys.accessToken);
    await securePref.delete(key: KCacheKeys.refreshToken);
  }
}
