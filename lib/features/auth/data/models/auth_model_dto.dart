import 'package:json_annotation/json_annotation.dart';
import 'package:quick_send/core/models/user_model_dto.dart';

part 'auth_model_dto.g.dart';

@JsonSerializable()
class AuthModelDto {
  AuthModelDto({this.id, this.accessToken, this.user});

  factory AuthModelDto.fromJson(Map<String, dynamic> json) =>
      _$AuthModelDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AuthModelDtoToJson(this);

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'access_token')
  final String? accessToken;

  @JsonKey(name: 'user')
  final UserModelDto? user;
}
