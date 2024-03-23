import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/controllers/add_task_controller.dart';

class CustomMenu extends StatelessWidget {
  final List<String> items;
  final String type;
  CustomMenu({required this.items, required this.type});

  @override
  Widget build(BuildContext context) {
    TaskController controller = Get.find();
    return IconButton(
      onPressed: () {
        showMenu<String>(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          context: context,
          position: RelativeRect.fromLTRB(25, 100, 25, 25),
          items: items
              .map((e) => PopupMenuItem<String>(
                    child: Text(
                      '${e}',
                    ),
                    value: '${e}',
                  ))
              .toList(),
          elevation: 8.0,
        ).then<void>((String? val) {
          if (val != null) {
            if (type == 'project') {
              controller.selectProject(val);
            } else if (type == 'feature') {
              controller.selectFeature(val);
            } else if (type == 'type') {
              controller.selectTaskType(val);
            }
          }
        });
      },
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
    );
  }
}
