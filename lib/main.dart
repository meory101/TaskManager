import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/bindings/app_binding.dart';
import 'package:task_manager/middleware/auth_middleware.dart';
import 'package:task_manager/theme/colors.dart';
import 'package:task_manager/views/pages/add_task.dart';
import 'package:task_manager/views/pages/login.dart';
import 'package:task_manager/views/pages/tab_bar.dart';

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const TaskManager());
}

class TaskManager extends StatefulWidget {
  const TaskManager({super.key});

  @override
  State<TaskManager> createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      initialRoute: "/login",
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.main_white,
      ),
      getPages: [
        GetPage(
          name: "/",
          page: () => const Login(),
        ),
        GetPage(
            name: "/login",
            page: () => const Login(),
            middlewares: [AuthMidlleware()]),
        GetPage(
          name: "/home",
          page: () => AppTabBar(),
        ),
        GetPage(
          name: "/addtask",
          page: () => AddTask(),
        ),
      ],
    );
  }
}
