import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_manager/theme/colors.dart';

LoadData() {
  Get.defaultDialog(
    barrierDismissible: false,
    backgroundColor: Colors.transparent,
    title: '',
    content: SizedBox(
      height: 40,
      width: 40,
      child: CircularProgressIndicator(
        color: AppColor.main_blue,
      ),
    ),
  );
}
