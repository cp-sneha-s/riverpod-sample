import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'add_employee_state_notifier.dart';

class AddEmployeeScreen extends StatefulHookConsumerWidget {
  final int? employeeId;

  const AddEmployeeScreen({super.key, this.employeeId});

  @override
  ConsumerState<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends ConsumerState<AddEmployeeScreen> {
  void _observeError() {
    ref.listen(
        addEmployeeProvider(widget.employeeId).select((value) => value.error),
        (previous, current) {
      if (current != null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Something went wrong"),
        ));
      }
    });
  }

  void _observeEmployeeAdded() {
    ref.listen(
        addEmployeeProvider(widget.employeeId)
            .select((value) => value.employeeAdded), (previous, current) {
      if (current != null) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _observeError();
    _observeEmployeeAdded();
    final notifier = ref.read(addEmployeeProvider(widget.employeeId).notifier);
    final state = ref.watch(addEmployeeProvider(widget.employeeId));
    final joiningDate = DateFormat('yyyy-MM-dd').format(state.joiningDate);

    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final phoneController = useTextEditingController();
    final addressController = useTextEditingController();

    nameController.text = state.name;
    emailController.text = state.email;
    phoneController.text = state.phone;
    addressController.text = state.address;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Employee'),
      ),
      body: state.isLoading
          ? const CircularProgressIndicator()
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                AppTextField(
                  label: "name",
                  controller: nameController,
                  onChanged: notifier.nameChanged,
                ),
                AppTextField(
                  label: "email",
                  controller: emailController,
                  onChanged: notifier.emailChanged,
                ),
                AppTextField(
                  label: "phone",
                  controller: phoneController,
                  onChanged: notifier.phoneChanged,
                ),
                AppTextField(
                  label: "address",
                  controller: addressController,
                  onChanged: notifier.addressChanged,
                ),
                const SizedBox(
                  height: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("Joining Date"),
                    const SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        ).then((value) {
                          if (value != null) {
                            notifier.joiningDateChanged(value);
                          }
                        });
                      },
                      child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(joiningDate)),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                ElevatedButton(
                  onPressed: notifier.save,
                  child: state.saving
                      ? const CircularProgressIndicator()
                      : const Text('Save'),
                ),
              ],
            ),
    );
  }
}

class AppTextField extends HookWidget {
  final String label;
  final Function(String) onChanged;
  final TextEditingController controller;

  const AppTextField(
      {super.key,
      required this.label,
      required this.onChanged,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
            border: const OutlineInputBorder(), labelText: label),
      ),
    );
  }
}
