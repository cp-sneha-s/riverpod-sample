import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../database/employee_database.dart';
import '../../model/employee/employee.dart';

part 'add_employee_state_notifier.freezed.dart';

part 'add_employee_state_notifier.g.dart';

@riverpod
class AddEmployee extends _$AddEmployee {
  @override
  AddEmployeeState build(int? employeeId) {
    state = AddEmployeeState(joiningDate: DateTime.now());
    if(employeeId != null){
      setData();
    }
    return state;
  }

  void setData() async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      final database = ref.read(employeeDatabaseProvider);
      final employee = await database.getEmployee(employeeId!);
      if (employee == null) {
        state = state.copyWith(error: "Employee not found");
      } else {
        state = state.copyWith(
          name: employee.name,
          email: employee.email,
          phone: employee.phone,
          address: employee.address,
          joiningDate: employee.joiningDate,
          isLoading: false,
        );
      }
      state = state.copyWith(isLoading: false);
    } catch (e) {
      throw e;
      state = state.copyWith(isLoading: false, error: e);
    }
  }

  void nameChanged(String name) {
    state = state.copyWith(name: name);
  }

  void emailChanged(String email) {
    state = state.copyWith(email: email);
  }

  void phoneChanged(String phone) {
    state = state.copyWith(phone: phone);
  }

  void addressChanged(String address) {
    state = state.copyWith(address: address);
  }

  void joiningDateChanged(DateTime joiningDate) {
    state = state.copyWith(joiningDate: joiningDate);
  }

  void save() async {
    try {
      state = state.copyWith(saving: true, error: null);
      final database = ref.read(employeeDatabaseProvider);
      final employee = Employee(
        id: DateTime.now().millisecondsSinceEpoch,
        name: state.name,
        phone: state.phone,
        email: state.email,
        address: state.address,
        joiningDate: state.joiningDate,
      );
      await database.insertEmployee(employee);
      state = state.copyWith(saving: false, employeeAdded: DateTime.now());
    } catch (e) {
      state = state.copyWith(saving: false, error: e);
    }
  }
}

@freezed
class AddEmployeeState with _$AddEmployeeState {
  const factory AddEmployeeState(
      {@Default('') String name,
      @Default('') String email,
      @Default('') String phone,
      @Default('') String address,
      required DateTime joiningDate,
      @Default(false) bool isLoading,
      Object? error,
      DateTime? employeeAdded,
      @Default(false) bool saving}) = _AddEmployeeState;
}
