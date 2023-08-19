import 'package:flutter/material.dart';
import 'package:leaf_tutorial_todo/util/constants.dart';

Widget customAppBar(
    BuildContext context,
    String title,
    IconData firstIcon,
    IconData secondIcon,
    void Function() firstIconFunction,
    void Function() secondIconFunction) {
  return Container(
    height: kPad(context) * .25,
    width: kPad(context),
    decoration: const BoxDecoration(color: white2),
    padding: EdgeInsets.symmetric(horizontal: kPad(context) * .03),
    child: Center(
      child: SafeArea(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: firstIconFunction,
              icon: Icon(
                firstIcon,
                color: dark.withOpacity(.5),
              )),
          Text(
            title,
            style: style(context).copyWith(
                fontSize: kPad(context) * .04, fontWeight: FontWeight.w400),
          ),
          IconButton(
              onPressed: secondIconFunction,
              icon: Icon(
                secondIcon,
                color: dark.withOpacity(.5),
              )),
        ],
      )),
    ),
  );
}
