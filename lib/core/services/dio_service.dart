import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:quick_send/app/app_config.dart';
import 'package:quick_send/core/router/app_router.dart';
import 'package:quick_send/core/services/cached_service.dart';
import 'package:quick_send/core/services/di/dependency_injector.dart';
import 'package:quick_send/features/auth/data/sources/auth_datasource.dart';
import 'package:quick_send/shared/constants/logger.dart';

class DioService {
  DioService({required this.config, this.isLogEnabled = false}) {
    initDio();
  }
  final bool isLogEnabled;
  final AppConfig config;

  late Dio dio;

  final CachedService cachedService = locator<CachedService>();
  final AppRouter appRouter = locator<AppRouter>();

  late AuthDatasource authClient;

  void initDio() {
    dio = Dio();
    if (isLogEnabled) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: isLogEnabled,
          responseHeader: isLogEnabled,
          requestBody: isLogEnabled,
          responseBody: isLogEnabled,
          error: isLogEnabled,
          compact: isLogEnabled,
          maxWidth: 90,
        ),
      );
    }

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          log('gets here?');
          String? token = await cachedService.getToken();

          if (config.apikey != null) {
            options.headers.addAll(<String, String>{'apikey': config.apikey!});
          }

          if (token != null) {
            options.headers.addAll(<String, String>{
              'Authorization': 'Bearer $token',
            });
          }

          options.contentType = 'application/json; charset=utf-8';

          return handler.next(options);
        },
        onResponse: (response, handler) async {
          logger.w(response);
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          logger.e(e);
          late DioException exception;

          if (e.type == DioExceptionType.connectionError ||
              e.type == DioExceptionType.connectionTimeout) {
            exception = e;
            handler.reject(exception);
          }
          if (e.type == DioExceptionType.badResponse) {
            exception = e.copyWith(
              message: e.response?.data['message'].runtimeType == String
                  ? e.response?.data['message']
                  : e.response?.data['message']
                        .map((error) => error)
                        .join('\n'),
            );
          }

          return handler.next(exception);
        },
      ),
    );

    authClient = AuthDatasource(dio, baseUrl: config.apiUrl);
  }
}
