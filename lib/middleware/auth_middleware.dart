import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:task_manager/main.dart';

class AuthMidlleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (prefs.getString('sessionToken') != null)
      return RouteSettings(name: "/home");
    else
      return RouteSettings(name: "/");
  }
}
