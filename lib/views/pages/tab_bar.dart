import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/controllers/home_controller.dart';
import 'package:task_manager/views/pages/add_task.dart';
import 'package:task_manager/views/pages/home_page.dart';
import 'package:task_manager/theme/colors.dart';
import 'package:task_manager/theme/fonts.dart';

class AppTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return DefaultTabController(
      initialIndex: 1,
      animationDuration: Duration(seconds: 1),
      length: 3,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: FloatingActionButton(
            elevation: 10,
            backgroundColor: AppColor.main_blue,
            onPressed: () {
              Get.to(
             ()=> AddTask(),
                fullscreenDialog: true,
                duration: Duration(
                  seconds: 2,
                ),
                curve: Curves.bounceOut,
              );
            },
            child: Icon(
              Icons.add,
              size: 40,
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: AppColor.main_white,
          actions: [
            IconButton(
              onPressed: controller.Logout,
              icon: Icon(
                Icons.logout_rounded,
                size: 20,
                color: AppColor.main_black,
              ),
            )
          ],
          title: Container(
            padding: EdgeInsets.only(top: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Hi,${controller.name}!',
                style: AppFonts.main_black_LF,
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'How is your productivity level today?',
                style: AppFonts.main_black_MF,
              ),
            ]),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: TabBar(
              labelColor: AppColor.main_blue,
              unselectedLabelColor: AppColor.main_grey,
              indicatorColor: AppColor.main_blue,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
              indicatorWeight: 3,
              tabs: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Pending',
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Assigned',
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Checked',
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text("Pending"),
            ),
            HomePage(),
            Center(
              child: Text('Checked'),
            ),
          ],
        ),
      ),
    );
  }
}
