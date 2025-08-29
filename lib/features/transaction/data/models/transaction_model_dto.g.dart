// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModelDto _$TransactionModelDtoFromJson(Map<String, dynamic> json) =>
    TransactionModelDto(
      id: json['id'] as String?,
      sender: json['sender'] == null
          ? null
          : UserModelDto.fromJson(json['sender'] as Map<String, dynamic>),
      receiver: json['receiver'] == null
          ? null
          : UserModelDto.fromJson(json['receiver'] as Map<String, dynamic>),
      amount: (json['amount'] as num?)?.toDouble(),
      date: json['date'] == null
          ? null
          : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$TransactionModelDtoToJson(
  TransactionModelDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'sender': instance.sender,
  'receiver': instance.receiver,
  'amount': instance.amount,
  'date': instance.date?.toIso8601String(),
};
