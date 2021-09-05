import 'package:json_annotation/json_annotation.dart';

part 'g/errors.g.dart';

@JsonSerializable()
class Errors {
  final String status;
  final String code;
  final String message;

  Errors(
    this.status,
    this.code,
    this.message,
  );

  factory Errors.fromJson(Map<String, dynamic> json) => _$ErrorsFromJson(json);
}
