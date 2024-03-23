import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/views/components/card_bottom.dart';
import 'package:task_manager/views/components/task_options.dart';
import 'package:task_manager/theme/fonts.dart';

class TaskCard extends StatelessWidget {
  final String content;
  final String hour;
  final String date;
  final int percent;
  TaskCard(
      {required this.content,
      required this.hour,
      required this.date,
      required this.percent});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${content}',
              maxLines: 2,
              style: AppFonts.main_black_MF,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 10,
            ),
            TaskOptions(),
            SizedBox(
              height: 15,
            ),
            CardBottom(
              hour: hour,
              date: date,
              percent: percent,
            )
          ],
        ),
      ),
    );
  }
}
