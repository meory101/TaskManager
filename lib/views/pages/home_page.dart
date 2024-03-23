import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/controllers/home_controller.dart';
import 'package:task_manager/theme/colors.dart';
import 'package:task_manager/views/components/task_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 7),
          child: controller.tasksData == null
              ? Center(
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator(
                      color: AppColor.main_blue,
                    ),
                  ),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.tasksData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: TaskCard(
                        percent: controller.tasksData[index]['donePercentage'],
                        hour: '${controller.tasksData[index]['duration']}',
                        date: DateFormat('dd MMM').format(DateTime.parse(
                            '${controller.tasksData[index]['createdAt']}')),
                        content: controller.tasksData[index]['note'] == null
                            ? ''
                            : '${controller.tasksData[index]['note']}',
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
