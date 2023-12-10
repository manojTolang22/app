import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskItem extends StatelessWidget {
  final bool value;
  final String title;
  final void Function(bool?)? onChanged;
  final void Function(BuildContext)? onDelete;
  final void Function(BuildContext)? onEdit;

  const TaskItem(
      {super.key,
      required this.value,
      required this.title,
      required this.onChanged,
      required this.onDelete,
      required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SizedBox(
            width: 5,
          ),
          SlidableAction(
            borderRadius: BorderRadius.circular(12),
            backgroundColor: Colors.grey.shade300,
            onPressed: onEdit,
            icon: Icons.edit,
          ),
          SizedBox(
            width: 5,
          ),
          SlidableAction(
            borderRadius: BorderRadius.circular(12),
            backgroundColor: Colors.red,
            onPressed: onDelete,
            icon: Icons.delete,
          ),
        ]),
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade200),
          child: Row(children: [
            Transform.scale(
              scale: 1.3,
              child: Checkbox(
                value: value,
                onChanged: onChanged,
                activeColor: Colors.green,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.grey.shade600),
            )
          ]),
        ),
      ),
    );
  }
}
