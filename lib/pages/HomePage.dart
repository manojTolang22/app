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
/*_controller: A TextEditingController for handling input in the pop-up box.
mybox: A Hive box named "TODO_TASK_DTABASE" for storing To-Do tasks.
db: An instance of the Database class for managing the To-Do tasks. */

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

  /*Initializes the app state by checking if there is existing data in the Hive box.
   If not, it initializes some initial data using db.initialdata(). 
   Then, it loads existing data or initializes data and updates the database. */

/*The ontaskcompleted method is responsible for toggling the completion 
status of a task when the user interacts with its checkbox.  */
  void ontaskcompleted(int index) {
    setState(() {
      db.allToDolist[index][0] = !db.allToDolist[index][0];
    });
    db.updateDatabase();
  }
/*1. setState(() {...}):
setState is used to rebuild the widget tree with the updated state.
Inside the setState function, the completion status of the task at 
the specified index is toggled. It's achieved by negating the current
 value using !.
 
 2.Updating the Task Completion Status:
db.allToDolist[index][0] represents the completion status of the task at the specified index.
!db.allToDolist[index][0] toggles the completion status. If it was true, it becomes false, and vice versa.

3.db.updateDatabase():
After updating the completion status in the local state, the updateDatabase method of the Database class is 
called to persist the changes in the database. 

In summary, this method is responsible for updating the completion status of a task,
and it ensures that the UI reflects this change by using setState.
After updating the local state, it then persists the changes to 
the database using the updateDatabase method.*/

/*The addNewTask method is responsible for displaying a pop-up box when the user wants to add a new task.
 Let's go through the code: */
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
    _controller.clear();
    db.updateDatabase();
  }
/*showDialog:

Displays a dialog box (pop-up) on the screen.
The popUpBox widget is used to create the content of the dialog.


popUpBox Widget:
The popUpBox widget is presumably a custom widget (not provided in the code snippet).
 It seems to be a pop-up for entering new task details, with a text input field,
  "Cancel" button, and "Save" button.


onTaskSave:
The onTaskSave callback is passed to the popUpBox widget. 
It will be triggered when the user presses the "Save" button in the pop-up.

Updating the Database:
After the dialog is closed, the db.updateDatabase() method is called.
This likely updates the database with the new task information.

In summary, when the user wants to add a new task, 
this method displays a pop-up box for entering task details. 
The user can enter details and press the "Save" button.
 The onTaskSave callback is triggered, and after the dialog is closed,
  the db.updateDatabase() method is called to persist the changes in the database.
 */

/*The onTaskSave method is invoked when the user saves a new task,
 typically after entering task details in the pop-up dialog. Let's break down the code: */
  void onTaskSave() {
    setState(() {
      db.allToDolist.add([false, _controller.text]);
    });
    db.updateDatabase();
    Navigator.of(context).pop();
  }
/*setState(() {...}):

setState is used to rebuild the widget tree with the updated state.
Inside the setState function, a new task is added to the local state.

Adding a New Task:
db.allToDolist.add([false, _controller.text]): Adds a new task to the list of tasks.
[false, _controller.text]: Represents the new task with completion status (false) 
and the task description (captured from _controller.text).

db.updateDatabase():
After updating the local state with the new task, the updateDatabase method of the Database class is called to persist the changes in the database.

Navigator.of(context).pop():
Closes the pop-up dialog after saving the new task. 

In summary, this method is responsible for adding a new task to the local state,
 updating the database with the new task, and closing the pop-up dialog.
  It ensures that the UI reflects the addition of the new task by using 
  setState and persists the changes to the database.

*/

/*
The onTaskDelete method is responsible for deleting a task when the user initiates the deletion action.
 Let's break down the code: */
  void onTaskDelete(int index) {
    setState(() {
      db.allToDolist.removeAt(index);
    });
    db.updateDatabase();
  }
/*setState(() {...}):

setState is used to rebuild the widget tree with the updated state.
Inside the setState function, a task is removed from the local state.

Removing a Task:
db.allToDolist.removeAt(index): Removes the task at the specified index from the list of tasks.

db.updateDatabase():
After updating the local state by removing the task, the updateDatabase method 
of the Database class is called to persist the changes in the database.

In summary, this method is responsible for removing a task from the local state,
ensuring that the UI reflects this change by using setState,
and then persisting the changes to the database using the updateDatabase method.
This is typically called when the user initiates the deletion of a task in the user interface. */

/*
The onEdit method is responsible for showing a pop-up dialog to edit a task when the user
initiates the editing action. */
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
/* showDialog:

Displays a dialog box (pop-up) on the screen.
The popUpBox widget is used to create the content of the dialog.

popUpBox Widget:
The popUpBox widget is presumably a custom widget (not provided in the code snippet).
It seems to be a pop-up for updating task details, with a text input field,
"Cancel" button, and "Update" button.The onTaskSave callback is passed to the popUpBox widget. 
It will be triggered when the user presses the "Update" button in the pop-up.

onTaskUpdate:
The onTaskUpdate method is invoked when the user updates the task in the pop-up dialog. It is passed the index of the task being edited.
In summary, when the user wants to edit a task, this method shows a pop-up box for updating task details. The user can enter updated details and press the "Update" button. The onTaskUpdate callback is triggered, passing the index of the task being edited. */

/*
The onTaskUpdate method is responsible for updating the details of a task 
when the user confirms the update in the pop-up dialog. */
  void onTaskUpdate(int index) {
    setState(() {
      db.allToDolist[index][1] = _controller.text;
      db.updateDatabase();
    });
    _controller.clear();
    Navigator.pop(context);
  }
  /* this method is responsible for updating the details of a task,
  ensuring that the UI reflects this change by using setState,
  persisting the changes to the database using the updateDatabase method,
  clearing the text controller, and closing the pop-up dialog. */

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
/*this build method creates a scaffolded page with a floating action button for 
adding tasks and a scrollable list of tasks using ListView.builder. 
Each task item is represented by a TaskItem widget,and user actions on task 
items are handled by various callback methods. */
