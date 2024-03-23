import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/controllers/login_controller.dart';
import 'package:task_manager/views/components/rec_button.dart';
import 'package:task_manager/views/components/text_form.dart';
import 'package:task_manager/theme/fonts.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController(context: context));
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 100),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/login.png'),
                    ),
                  ),
                ),
                Text(
                  'Hello Again!',
                  style: AppFonts.main_white_LF,
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  'Welcome Back',
                  style: AppFonts.main_white_MF,
                ),
                SizedBox(
                  height: 30,
                ),
                TextForm(
                  keytype: TextInputType.text,
                  hint: 'Enter your user name',
                  controller: controller.name,
                  maxlines: 1,
                  prefix: Icon(
                    CupertinoIcons.person,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextForm(
                  keytype: TextInputType.text,
                  controller: controller.password,
                  obscure: true,
                  hint: 'Enter your password',
                  maxlines: 1,
                  prefix: Icon(
                    CupertinoIcons.lock,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                RecButton(
                  width: double.infinity,
                  height: 55,
                  onTap: controller.Login,
                  buttontext: 'Sign in',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
