import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/theme/colors.dart';
import 'package:task_manager/theme/fonts.dart';

class CardBottom extends StatelessWidget {
  final String hour;
  final String date;
  final int percent;
  const CardBottom(
      {super.key,
      required this.hour,
      required this.date,
      required this.percent});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColor.sub_grey_liner),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.clock,
                        color: AppColor.icon_color,
                      ),
                      SizedBox(width: 2,),
                      Text(
                        hour + 'h',
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Container(
                        height: 20,
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                                color: AppColor.sub_grey_liner, width: 2),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Icon(
                        CupertinoIcons.calendar,
                        color: AppColor.icon_color,
                      ),
                      SizedBox(
                        width: 2,
                      ),

                      Text(
                        date,
                      )
                    ],
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColor.main_black,
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 5),
          width: MediaQuery.of(context).size.width,
          height: 7,
          decoration: BoxDecoration(
            color: AppColor.sub_blue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: (MediaQuery.of(context).size.width * percent) / 100,
              decoration: BoxDecoration(
                color: AppColor.main_blue,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Text(
          '${percent}%',
          style: AppFonts.main_black_MF,
          textAlign: TextAlign.left,
        )
      ],
    );
  }
}
