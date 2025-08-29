import 'package:json_annotation/json_annotation.dart';
import 'package:quick_send/features/auth/domain/entities/user_entity.dart';

part 'user_model_dto.g.dart';

@JsonSerializable()
class UserModelDto {
  UserModelDto({this.id, this.name, this.phoneNumber});

  factory UserModelDto.fromJson(Map<String, dynamic> json) =>
      _$UserModelDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelDtoToJson(this);

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
}

extension UserModelDtoEntity on UserModelDto {
  UserEntity toEntity() {
    return UserEntity(id: id, name: name, phoneNumber: phoneNumber);
  }

  UserModelDto fromEntity(UserEntity entity) {
    return UserModelDto(
      id: entity.id,
      name: entity.name,
      phoneNumber: entity.phoneNumber,
    );
  }
}
