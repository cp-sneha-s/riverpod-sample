import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_sample/model/employee/employee.dart';
import 'package:sqflite/sqflite.dart';

part 'employee_database.g.dart';
const String dbName = "employees";


final databaseProvider = Provider<Database>((ref) {
  throw UnimplementedError();
});





@riverpod
EmployeeDatabase employeeDatabase(Ref ref){
  return EmployeeDatabase(ref.read(databaseProvider));
}


class EmployeeDatabase{
  final Database database;

  EmployeeDatabase(this.database);

  Future<void> insertEmployee(Employee employee) async {
    await database.insert(
      dbName,
      employee.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Employee>> getEmployees() async {
    final List<Map<String, dynamic>> maps = await database.query('employees');
    return List.generate(maps.length, (i) {
      return Employee.fromJson(maps[i]);
    });
  }


  Future<Employee?> getEmployee(int id) async {
    List<Map<String,dynamic>> maps = await database.query(dbName,
        columns: ["id", "name", "phone", "email", "address", "joiningDate"],
        where: 'id = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Employee.fromJson(maps.first);
    }
    return null;
  }
}

Future<Database> getDatabase()async{
  var databasePath = await getDatabasesPath();
  final path = join(databasePath, "Employee.db");

  return await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
        "CREATE TABLE $dbName(id INTEGER, name TEXT, phone TEXT, email TEXT, address TEXT, joiningDate TEXT)",
      );
    },
  );
}