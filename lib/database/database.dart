/*This Dart class named Database appears to be a simple database
management class utilizing the Hive database for storing and 
retrieving task-related data. Let's break down the key parts 
of the class: */

import 'package:hive/hive.dart';

class Database {

  /*The line var mybox = Hive.box("TODO_TASK_DTABASE"); is creating an instance of a Hive box.  */
  var mybox = Hive.box("TODO_TASK_DTABASE");
  List allToDolist = [];



  /*The initialdata() method in your Database class is responsible for initializing
   the allToDolist variable with some default tasks. */
  initialdata() {
    allToDolist = [
      [false, "Wakeup at 4:30 AM "],
      [false, "Run for a mile"],
      [false, "2 hourse of maditate"],
    ];
  }



/*
The loadeExistingData() method in our Database class is responsible for loading 
existing tasks from the Hive database.  */
  loadeExistingData() {
    allToDolist = mybox.get("TASKS");
  }
/* loadeExistingData() is a method responsible for fetching existing tasks 
from the Hive database and updating the allToDolist variable with the retrieved tasks. */



/*The updateDatabase() method in your Database class is responsible for updating the tasks stored in the Hive database. */
  updateDatabase() {
    mybox.put("TASKS", allToDolist);
  }
  /*updateDatabase() is a method responsible for persisting the tasks stored
  in the allToDolist variable to the Hive database, ensuring that changes to 
  the task list are saved for future use. */
}
