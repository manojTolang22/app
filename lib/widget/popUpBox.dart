import 'package:flutter/material.dart';
import 'package:todo_app/widget/button.dart';

/*This widget provides a reusable pop-up box for entering or updating
 a task with customizable buttons and appearance. */

class popUpBox extends StatelessWidget {
  final VoidCallback onTaskSave;
  final textcontroller;
  final String hintText, bottonName1, bottonname2;

  popUpBox(
      {super.key,
      required this.hintText,
      required this.onTaskSave,
      required this.textcontroller,
      required this.bottonName1,
      required this.bottonname2});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade300,
      content: Container(
        height: 125,
        decoration: BoxDecoration(),
        child: Column(
          children: [
            TextField(
              controller: textcontroller,
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Buttonss(
                    buttonName: bottonName1,
                    onbuttonPressed: () {
                      Navigator.pop(context);
                    }),
                SizedBox(
                  width: 10,
                ),
                Buttonss(
                  buttonName: bottonname2,
                  onbuttonPressed: onTaskSave,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
