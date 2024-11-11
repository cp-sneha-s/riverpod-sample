import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/ui/home/home_state_notifier.dart';

import '../add/add_employee_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeStateNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: state.loading
          ? const CircularProgressIndicator()
          : ListView.separated(
              itemBuilder: (context, index) {
                final employee = state.employees[index];
                return ListTile(
                  title: Text(employee.name),
                  subtitle: Text(employee.email),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddEmployeeScreen(employeeId: employee.id)));
                  },
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: state.employees.length,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddEmployeeScreen()));
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
