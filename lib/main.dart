import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/ui/home/home_screen.dart';

import 'database/employee_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final db = await getDatabase();

  runApp(ProviderScope(overrides: [
    databaseProvider.overrideWithValue(db),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}