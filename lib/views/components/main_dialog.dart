import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/views/components/rec_button.dart';
import 'package:task_manager/theme/fonts.dart';

MainDialog(context, title, subtitle, canclelabel, confirmlabel,confirmFun) {
  return showDialog(
    context: context,
    builder: (context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          titlePadding: EdgeInsets.only(top: 20),
          contentPadding: EdgeInsets.only(top: 7, bottom: 20),
          actionsPadding: EdgeInsets.only(bottom: 20),
          title: Text(
            '${title}',
            textAlign: TextAlign.center,
            style: AppFonts.main_blue_LF,
          ),
          content: Text(
            '${subtitle}',
            style: AppFonts.main_gery_SF,
            textAlign: TextAlign.center,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RecButton(
                  width: 120,
                  height: 40,
                  buttontext: '${confirmlabel}',
                  onTap: confirmFun,
                ),
                RecButton(
                  color: Colors.transparent,
                  style: AppFonts.main_blue_MF,
                  width: 120,
                  height: 40,
                  buttontext: '${canclelabel}',
                  onTap: () {
                    Get.back();
                  },
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
