import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/main.dart';
import 'package:task_manager/utils/http_methods.dart';
import 'package:task_manager/utils/links.dart';
import 'package:task_manager/views/pages/tab_bar.dart';

class LoginController extends GetxController {
  late BuildContext context;

  LoginController({required this.context});
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  void Login() async {
    var headers = {
      "X-Parse-REST-API-Key": "EicRaktr5Zp99f284ve8",
      "X-Parse-Application-Id": "FKj8b573OoKNlADnvh7G",
      "X-Parse-Master-Key": "61vjNkYBZAhPMPo0lILXS3n8BdLzcs1JvOtGkxOl"
    };
    Map data = {
      "username": "${name.text}",
      "password": "${password.text}",
    };
    
    FocusScope.of(context).unfocus();
    var response = await PostMethod(Links.login, data, headers);
    if (response != null) {
      name.clear();
      password.clear();

      prefs.setString('sessionToken', '${response['sessionToken']}');
      prefs.setString('userName', '${response['username']}');
      prefs.setString('objectId', '${response['objectId']}');
      Get.to(
        () => AppTabBar(),
        fullscreenDialog: true,
        duration: Duration(
          seconds: 2,
        ),
        curve: Curves.bounceOut,
      );
    }
  }
}
