// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../errors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Errors _$ErrorsFromJson(Map<String, dynamic> json) {
  return Errors(
    json['status'] as String,
    json['code'] as String,
    json['message'] as String,
  );
}

Map<String, dynamic> _$ErrorsToJson(Errors instance) => <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
    };
