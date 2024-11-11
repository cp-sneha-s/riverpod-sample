import 'package:freezed_annotation/freezed_annotation.dart';

class TimeStampJsonConverter extends JsonConverter<DateTime, String> {
  const TimeStampJsonConverter();

  @override
  DateTime fromJson(Object json) {
    if (json is String) {
      return DateTime.parse(json);
    } else {
      throw Exception('Invalid format');
    }
  }

  @override
  String toJson(DateTime object) => object.toIso8601String();
}