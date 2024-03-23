import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task_manager/theme/colors.dart';
import 'package:task_manager/theme/fonts.dart';
import 'package:task_manager/views/components/load.dart';

GetMethod(String url, Map<String, String>? headers) async {
  try {
    http.Response response = await http.get(
      headers: headers,
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return body;
    } else {
      var body = jsonDecode(response.body);

      Get.snackbar(
        'Error',
        '${body['error']}',
        titleText: Text(
          'Error',
          style: AppFonts.main_red_MF,
        ),
        messageText: Text('${body['error']}'),
        animationDuration: Duration(seconds: 2),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  } catch (e) {
    Get.snackbar(
      'Error',
      '${e}',
      titleText: Text(
        'Error',
        style: AppFonts.main_red_MF,
      ),
      messageText: Text('Server error'),
      animationDuration: Duration(seconds: 2),
      backgroundColor: AppColor.main_white,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

PostMethod(String url, Map body, Map<String, String>? headers) async {
  LoadData();
  try {
    http.Response response =
        await http.post(headers: headers, Uri.parse(url), body: body);
    print(response.body);
    print(response.statusCode);
    Get.back();
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return body;
    } else {
      var body = jsonDecode(response.body);

      Get.snackbar(
        'Error',
        '${body['error']}',
        titleText: Text(
          'Error',
          style: AppFonts.main_red_MF,
        ),
        messageText: Text('${body['error']}'),
        animationDuration: Duration(seconds: 2),
        backgroundColor: AppColor.main_white,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  } catch (e) {
    Get.snackbar(
      'Error',
      '${e}',
      titleText: Text(
        'Error',
        style: AppFonts.main_red_MF,
      ),
      messageText: Text('Server error'),
      animationDuration: Duration(seconds: 2),
      backgroundColor: AppColor.main_white,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
