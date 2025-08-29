// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModelDto _$AuthModelDtoFromJson(Map<String, dynamic> json) => AuthModelDto(
  id: json['id'] as String?,
  accessToken: json['access_token'] as String?,
  user: json['user'] == null
      ? null
      : UserModelDto.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthModelDtoToJson(AuthModelDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'access_token': instance.accessToken,
      'user': instance.user,
    };
