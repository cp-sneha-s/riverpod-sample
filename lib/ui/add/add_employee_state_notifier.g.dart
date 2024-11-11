// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_employee_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addEmployeeHash() => r'2050ac5ce4fdc755a38bc919b914cf80415ec555';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$AddEmployee
    extends BuildlessAutoDisposeNotifier<AddEmployeeState> {
  late final int? employeeId;

  AddEmployeeState build(
    int? employeeId,
  );
}

/// See also [AddEmployee].
@ProviderFor(AddEmployee)
const addEmployeeProvider = AddEmployeeFamily();

/// See also [AddEmployee].
class AddEmployeeFamily extends Family<AddEmployeeState> {
  /// See also [AddEmployee].
  const AddEmployeeFamily();

  /// See also [AddEmployee].
  AddEmployeeProvider call(
    int? employeeId,
  ) {
    return AddEmployeeProvider(
      employeeId,
    );
  }

  @override
  AddEmployeeProvider getProviderOverride(
    covariant AddEmployeeProvider provider,
  ) {
    return call(
      provider.employeeId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'addEmployeeProvider';
}

/// See also [AddEmployee].
class AddEmployeeProvider
    extends AutoDisposeNotifierProviderImpl<AddEmployee, AddEmployeeState> {
  /// See also [AddEmployee].
  AddEmployeeProvider(
    int? employeeId,
  ) : this._internal(
          () => AddEmployee()..employeeId = employeeId,
          from: addEmployeeProvider,
          name: r'addEmployeeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addEmployeeHash,
          dependencies: AddEmployeeFamily._dependencies,
          allTransitiveDependencies:
              AddEmployeeFamily._allTransitiveDependencies,
          employeeId: employeeId,
        );

  AddEmployeeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.employeeId,
  }) : super.internal();

  final int? employeeId;

  @override
  AddEmployeeState runNotifierBuild(
    covariant AddEmployee notifier,
  ) {
    return notifier.build(
      employeeId,
    );
  }

  @override
  Override overrideWith(AddEmployee Function() create) {
    return ProviderOverride(
      origin: this,
      override: AddEmployeeProvider._internal(
        () => create()..employeeId = employeeId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        employeeId: employeeId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<AddEmployee, AddEmployeeState>
      createElement() {
    return _AddEmployeeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddEmployeeProvider && other.employeeId == employeeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, employeeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddEmployeeRef on AutoDisposeNotifierProviderRef<AddEmployeeState> {
  /// The parameter `employeeId` of this provider.
  int? get employeeId;
}

class _AddEmployeeProviderElement
    extends AutoDisposeNotifierProviderElement<AddEmployee, AddEmployeeState>
    with AddEmployeeRef {
  _AddEmployeeProviderElement(super.provider);

  @override
  int? get employeeId => (origin as AddEmployeeProvider).employeeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
