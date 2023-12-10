import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/database/database.dart';
import 'package:todo_app/widget/popUpBox.dart';
import 'package:todo_app/widget/taskItem.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final mybox = Hive.box("TODO_TASK_DTABASE");
  Database db = Database();

  @override
  void initState() {
    if (mybox.get("TASKS") == null) {
      db.initialdata();
    } else {
      db.loadeExistingData();
    }
    db.updateDatabase();
    super.initState();
  }

  void ontaskcompleted(int index) {
    setState(() {
      db.allToDolist[index][0] = !db.allToDolist[index][0];
    });
    db.updateDatabase();
  }

  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return popUpBox(
          hintText: "Add new task..",
          textcontroller: _controller,
          onTaskSave: onTaskSave,
          bottonName1: "Cancle",
          bottonname2: "Save",
        );
      },
    );
    db.updateDatabase();
  }

  void onTaskSave() {
    setState(() {
      db.allToDolist.add([false, _controller.text]);
    });
    db.updateDatabase();
    Navigator.of(context).pop();
  }

  void onTaskDelete(int index) {
    setState(() {
      db.allToDolist.removeAt(index);
    });
    db.updateDatabase();
  }

  void onEdit(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return popUpBox(
            hintText: "Update task",
            onTaskSave: () => onTaskUpdate(index),
            textcontroller: _controller,
            bottonName1: "Cancle",
            bottonname2: "Update");
      },
    );
  }

  void onTaskUpdate(int index) {
    setState(() {
      db.allToDolist[index][1] = _controller.text;
      db.updateDatabase();
    });
    _controller.clear();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewTask();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green.shade200,
      ),
      body: SafeArea(
          child: ListView.builder(
  
        itemCount: db.allToDolist.length,
        itemBuilder: (context, index) {
          return TaskItem(
            value: db.allToDolist[index][0],
            title: db.allToDolist[index][1],
            onChanged: (p0) => ontaskcompleted(index),
            onDelete: (p0) => onTaskDelete(index),
            onEdit: (p0) => onEdit(index),
          );
        },
      )),
    );
  }
}
