import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod_sample/model/employee/employee.dart';

import '../../database/employee_database.dart';

part 'home_state_notifier.freezed.dart';

part 'home_state_notifier.g.dart';

@riverpod
class HomeStateNotifier extends _$HomeStateNotifier {

  @override
  HomeState build() {
    state = HomeState();
    fetchEmployees();
    return state;
  }

  void fetchEmployees()async{
    try {
      state = state.copyWith(loading: true, error: null);
      final database = ref.read(employeeDatabaseProvider);
      final employees = await database.getEmployees();
      state = state.copyWith(employees: employees, loading: false);
    } catch (e) {
      state = state.copyWith(loading: false, error: e);
    }
  }
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<Employee> employees,
    @Default(false) bool loading,
    Object? error,
  }) = _HomeState;
}
