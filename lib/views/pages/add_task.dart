import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/controllers/add_task_controller.dart';
import 'package:task_manager/theme/fonts.dart';
import 'package:task_manager/views/components/custom_menu.dart';
import 'package:task_manager/views/components/main_dialog.dart';
import 'package:task_manager/views/components/rec_button.dart';
import 'package:task_manager/views/components/text_form.dart';
import 'package:task_manager/views/pages/tab_bar.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    TaskController controller = Get.find();

    return WillPopScope(
      onWillPop: () {
        Get.offAll(AppTabBar(),
            fullscreenDialog: true, duration: Duration(seconds: 1));

        return Future.value(true);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
          child: RecButton(
            width: double.infinity,
            height: 55,
            onTap: () {},
            buttontext: 'Add',
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          MainDialog(
                            context,
                            'Save task',
                            'Do you want to save this task',
                            'Cancle',
                            'Save',
                            () {
                              Get.back();
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 25,
                        ),
                      ),
                      Text(
                        'Add a task',
                        style: AppFonts.main_black_LF,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Project',
                    style: AppFonts.main_black_MF,
                  ),
                  GetBuilder<TaskController>(
                    builder: (controller) {
                      return TextForm(
                        controller: TextEditingController()
                          ..text = '${controller.selectedProject}',
                        readonly: true,
                        keytype: TextInputType.text,
                        suffix: CustomMenu(
                          items: controller.projectName!,
                          type: 'project',
                        ),
                        maxlines: 1,
                        hint: 'Select the project',
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Feature',
                              style: AppFonts.main_black_MF,
                            ),
                            GetBuilder<TaskController>(
                              builder: (controller) {
                                return TextForm(
                                  controller: TextEditingController()
                                    ..text = '${controller.selectedFeature}',
                                  readonly: true,
                                  keytype: TextInputType.text,
                                  suffix: CustomMenu(
                                      items: controller.featureName!,
                                      type: 'feature'),
                                  maxlines: 1,
                                  hint: 'Select a feature',
                                );
                              },
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Task Type',
                              style: AppFonts.main_black_MF,
                            ),
                            GetBuilder<TaskController>(
                              builder: (controller) {
                                return TextForm(
                                  controller: TextEditingController()
                                    ..text = '${controller.selectedtaskType}',
                                  readonly: true,
                                  keytype: TextInputType.text,
                                  suffix: CustomMenu(
                                      items: controller.taskTypeName!,
                                      type: 'type'),
                                  maxlines: 1,
                                  hint: 'Select a type',
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Done percentage',
                              style: AppFonts.main_black_MF,
                            ),
                            const TextForm(
                              keytype: TextInputType.number,
                              maxlines: 1,
                              hint: 'Input a percentage',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Duration',
                              style: AppFonts.main_black_MF,
                            ),
                            const TextForm(
                              keytype: TextInputType.number,
                              maxlines: 1,
                              hint: 'Duration in hours',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Description',
                    style: AppFonts.main_black_MF,
                  ),
                  const TextForm(
                    keytype: TextInputType.text,
                    maxlines: 4,
                    hint: 'Describe your task',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
