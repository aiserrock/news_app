import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class CustomDateTimeConverter implements JsonConverter<DateTime?, String?> {
  const CustomDateTimeConverter();

  @override
  DateTime? fromJson(String? rawDate) {
    if (rawDate == null || rawDate.isEmpty) return null;
    return DateTime.tryParse(rawDate);
  }

  @override
  String toJson(DateTime? json) => json!.toIso8601String();

  static String stringFromDate(DateTime? date) =>
      date != null ? DateFormat().format(date) : '';
}
