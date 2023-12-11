import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/pages/HomePage.dart';
/*Here, you import the necessary Flutter and Hive packages.
 hive is a lightweight and fast NoSQL database that you
  can use for local storage in your Flutter app.*/
 

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("TODO_TASK_DTABASE");
  runApp(const MyApp());
}

/*In the main function, you initialize Hive for Flutter using Hive.initFlutter().
 The Hive.openBox("TODO_TASK_DATABASE") line opens a box (similar to a table in a database)
  named "TODO_TASK_DATABASE". This is where your To-Do tasks will be stored. */

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


/*The HomePage class is a StatelessWidget representing the main screen of your To-Do app.
 It's currently empty, and you'll need to build the widget tree for your home page. */
