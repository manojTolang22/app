import 'package:flutter/material.dart';

 /*our Buttonss class is a StatelessWidget in Flutter that represents a reusable button widget. */
class Buttonss extends StatelessWidget {
  final String buttonName;
  final VoidCallback onbuttonPressed;

  const Buttonss(
      {super.key, required this.buttonName, required this.onbuttonPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.grey.shade200,
      onPressed: onbuttonPressed,
      child: Text(buttonName),
    );
  }
}

/*This widget provides a convenient way to create reusable buttons with customizable text and behavior. */