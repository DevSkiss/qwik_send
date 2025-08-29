import 'package:json_annotation/json_annotation.dart';
import 'package:quick_send/core/models/user_model_dto.dart';

part 'transaction_model_dto.g.dart';

@JsonSerializable()
class TransactionModelDto {
  TransactionModelDto({
    this.id,
    this.sender,
    this.receiver,
    this.amount,
    this.date,
    this.senderId,
  });

  factory TransactionModelDto.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionModelDtoToJson(this);

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'sender')
  final UserModelDto? sender;

  @JsonKey(name: 'sender_id')
  final String? senderId;

  @JsonKey(name: 'receiver')
  final UserModelDto? receiver;

  @JsonKey(name: 'amount')
  final double? amount;

  @JsonKey(name: 'created_at')
  final String? date;
}
