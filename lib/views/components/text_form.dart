import 'package:flutter/material.dart';
import 'package:task_manager/theme/colors.dart';
import 'package:task_manager/theme/fonts.dart';

class TextForm extends StatelessWidget {
  final String hint;
  final int maxlines;
  final Widget? suffix;
  final Widget? prefix;
  final TextInputType keytype;
  final bool? obscure;
  final TextEditingController? controller;
  final bool? readonly;
  const TextForm(
      {super.key,
      required this.hint,
      required this.maxlines,
      this.suffix,
      this.prefix,
      required this.keytype,
      this.obscure,
      this.readonly,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: TextFormField(
        readOnly: readonly != null ? readonly! : false,
        obscureText: obscure == null ? false : obscure!,
        controller: controller,
        keyboardType: keytype,
        cursorColor: AppColor.main_blue,
        maxLines: maxlines,
        decoration: InputDecoration(
          prefixIconColor: AppColor.main_grey,
          suffixIconColor: AppColor.main_grey,
          hintText: hint,
          hintMaxLines: 1,
          prefixIcon: prefix ?? prefix,
          suffixIcon: suffix ?? suffix,
          hintStyle: AppFonts.main_grey_MF,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColor.sub_grey_liner,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColor.sub_grey_liner,
            ),
          ),
        ),
      ),
    );
  }
}
