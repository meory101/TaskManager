import 'package:get/get.dart';
import 'package:task_manager/utils/http_methods.dart';
import 'package:task_manager/utils/links.dart';

class TaskController extends GetxController {
  var projects;
  List<String>? projectName;
  var features;
  List<String>? featureName;
  var taskType;
  List<String>? taskTypeName;

  String selectedProject = '';
  String selectedFeature = '';
  String selectedtaskType = '';

  void GetProjects() async {
    var headers = {
      'X-Parse-REST-API-Key': 'EicRaktr5Zp99f284ve8',
      'X-Parse-Application-Id': 'FKj8b573OoKNlADnvh7G',
      'X-Parse-Session-Token': 'r:c1f774a1177666621f4b1b2fa673962f',
    };
    var response = await GetMethod(Links.Project, headers);
    if (response != null) {
      projects = response['results'].map((i) => '${i['name']}').toList();
      projectName = List<String>.from(projects);
    } else {
      projects = [];
    }
    update();
  }

  void GetFeatures() async {
    var headers = {
      "X-Parse-REST-API-Key": "EicRaktr5Zp99f284ve8",
      "X-Parse-Application-Id": "FKj8b573OoKNlADnvh7G",
      "X-Parse-Session-Token": "r:c1f774a1177666621f4b1b2fa673962f"
    };
    var response = await GetMethod(Links.Feature, headers);
    if (response != null) {
      features = response['results'].map((i) => '${i['name']}').toList();
      featureName = List<String>.from(features);
    } else {
      features = [];
    }
    update();
  }

  void GetTaskType() async {
    var headers = {
      "X-Parse-REST-API-Key": "EicRaktr5Zp99f284ve8",
      "X-Parse-Application-Id": "FKj8b573OoKNlADnvh7G",
      "X-Parse-Session-Token": "r:c1f774a1177666621f4b1b2fa673962f"
    };
    var response = await GetMethod(Links.TaskType, headers);
    if (response != null) {
      taskType = response['results'].map((i) => '${i['name']}').toList();
      taskTypeName = List<String>.from(taskType);
    } else {
      taskType = [];
    }
    update();
  }

  selectProject(value) {
    selectedProject = value;
    update();
  }

  selectFeature(value) {
    selectedFeature = value;
    update();
  }

  selectTaskType(value) {
    selectedtaskType = value;
    update();
  }

  @override
  void onInit() {
    GetProjects();
    GetFeatures();
    GetTaskType();

    super.onInit();
  }
}
