import 'dart:js';

import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String name;
  final Function()? onClick;

  const MyButton(
    this.name, {
    Key? key,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFFFA45B),
        shape: StadiumBorder(),
      ),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
