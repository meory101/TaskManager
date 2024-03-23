import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TaskBox extends StatelessWidget {
  final String title;
  final Color boxColor;
  final TextStyle textStyle;
  TaskBox(
      {required this.title, required this.boxColor, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        '${title}',
        maxLines: 1,
        style: textStyle,
      ),
    );
  }
}
