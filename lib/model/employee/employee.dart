import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_sample/model/converter/timestamp_converter.dart';

part 'employee.freezed.dart';
part 'employee.g.dart';

@freezed
class Employee with _$Employee {
  const factory Employee({
    required int id,
    required String name,
    required String phone,
    required String email,
    required String address,
    @TimeStampJsonConverter() required DateTime joiningDate,
  }) = _Employee;

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

}
