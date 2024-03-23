import 'package:get/get.dart';
import 'package:task_manager/controllers/add_task_controller.dart';


class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TaskController(),permanent: true);
  }
}
