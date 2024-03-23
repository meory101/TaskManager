import 'package:get/get.dart';
import 'package:task_manager/main.dart';
import 'package:task_manager/utils/http_methods.dart';
import 'package:task_manager/utils/links.dart';
import 'package:task_manager/views/pages/login.dart';

class HomeController extends GetxController {
  String? name;
  var tasksData;

  void Logout() {
    prefs.clear();
    Get.offAll(() => const Login());
  }

  void GetTasks() async {
    var headers = {
      "X-Parse-REST-API-Key": "EicRaktr5Zp99f284ve8",
      "X-Parse-Application-Id": "FKj8b573OoKNlADnvh7G",
      "X-Parse-Session-Token": "r:c1f774a1177666621f4b1b2fa673962f"
    };
    String url = Links.Task;
    var response = await GetMethod(url, headers);
    if (response != null) {
      tasksData = response['results'];
    } else {
      tasksData = [];
    }
    update();
  }

  @override
  void onInit() {
    name = prefs.getString('userName');
    GetTasks();
    super.onInit();
  }
}
