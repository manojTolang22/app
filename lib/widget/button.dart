import 'package:flutter/material.dart';
 
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
