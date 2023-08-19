import 'package:flutter/material.dart';
import 'package:leaf_tutorial_todo/util/constants.dart';

Widget customTextField(
  BuildContext context,
  TextEditingController controller,
  String hintText,
  void Function(String) onChanged,
  bool obscureText,
) {
  return Container(
    height: kPad(context) * .15,
    width: kPad(context) * .9,
    decoration: BoxDecoration(
        color: blue.withOpacity(.1), borderRadius: BorderRadius.circular(7)),
    padding: EdgeInsets.symmetric(horizontal: kPad(context) * .05),
    child: Center(
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        cursorColor: blue,
        obscureText: obscureText,
        keyboardType: TextInputType.text,
        style:
            style(context).copyWith(fontWeight: FontWeight.w500, color: blue),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: style(context).copyWith(
                color: blue.withOpacity(.5), fontWeight: FontWeight.w500)),
      ),
    ),
  );
}
