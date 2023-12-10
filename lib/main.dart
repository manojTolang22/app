import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/pages/HomePage.dart';
 

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("TODO_TASK_DTABASE");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TO Do App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
