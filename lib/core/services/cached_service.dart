import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:quick_send/core/models/user_model_dto.dart';
import 'package:quick_send/core/services/di/dependency_injector.dart';
import 'package:quick_send/shared/constants/app_map_keys.dart';

abstract class CachedService {
  Future<void> cacheUserData(UserModelDto? userData);
  Future<UserModelDto?> getCacheUserData();
  Future<void> cacheToken(String token);
  Future<void> clearCacheToken();
  Future<String?> getToken();
}

//? Currently not used. storing credentials are done by supabase.
class CachedServiceImpl implements CachedService {
  final FlutterSecureStorage securePref = locator<FlutterSecureStorage>();

  @override
  Future<void> clearCacheToken() async {
    await securePref.deleteAll();
  }

  @override
  Future<void> cacheUserData(UserModelDto? userData) async {
    await securePref.write(
      key: KCacheKeys.user,
      value: json.encode(userData?.toJson()),
    );
  }

  @override
  Future<UserModelDto?> getCacheUserData() async {
    try {
      final res = json.decode(
        await securePref.read(key: KCacheKeys.user) ?? '',
      );
      if (res is! Map<String, dynamic>) return null;
      return UserModelDto.fromJson(res);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> cacheToken(String token) async {
    await securePref.write(key: KCacheKeys.accessToken, value: token);
  }

  @override
  Future<String?> getToken() async {
    return securePref.read(key: KCacheKeys.accessToken);
  }
}
