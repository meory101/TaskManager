import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/views/components/task_box.dart';
import 'package:task_manager/theme/colors.dart';
import 'package:task_manager/theme/fonts.dart';

class TaskOptions extends StatefulWidget {
  const TaskOptions({super.key});

  @override
  State<TaskOptions> createState() => _TaskOptionsState();
}

class _TaskOptionsState extends State<TaskOptions> {
  int _selectedOption = 0;
  List<String> options = ['Project Name', 'Task type', 'Feature'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width - 100,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            childAspectRatio: 130 / 35,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                _selectedOption = index;
              });
            },
            child: TaskBox(
              title: '${options[index]}',
              boxColor: _selectedOption == index
                  ? AppColor.sub_blue
                  : AppColor.sub_grey,
              textStyle: _selectedOption == index
                  ? AppFonts.main_blue_SF
                  : AppFonts.main_gery_SF,
            ),
          );
        },
      ),
    );
  }
}
