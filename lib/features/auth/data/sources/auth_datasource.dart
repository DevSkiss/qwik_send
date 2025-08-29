import 'package:dio/dio.dart' hide Headers;
import 'package:quick_send/shared/constants/url_constants.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_datasource.g.dart';

@RestApi()
abstract class AuthDatasource {
  factory AuthDatasource(Dio dio, {required String baseUrl}) = _AuthDatasource;

  @POST(KUrl.login)
  Future login({
    @Field('email') required String email,
    @Field('password') required String password,
  });

  @POST(KUrl.signup)
  @Headers({
    'Content-Type': 'application/json',
    'accept': 'application/json',
    'includeToken': 'true',
    'showLogs': 'true',
  })
  Future signup({
    @Field('email') required String email,
    @Field('password') required String password,
  });
}
