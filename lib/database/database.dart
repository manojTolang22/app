import 'package:hive/hive.dart';

class Database {
  var mybox = Hive.box("TODO_TASK_DTABASE");

  List allToDolist = [];
  initialdata() {
    allToDolist = [
      [false, "Wakeup at 4:30 AM "],
      [false, "Run for a mile"],
      [false, "2 hourse of maditate"],
    ];
  }

  loadeExistingData() {
    allToDolist = mybox.get("TASKS");
  }

  updateDatabase() {
    mybox.put("TASKS", allToDolist);
  }
}
