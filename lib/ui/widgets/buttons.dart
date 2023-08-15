import 'package:flutter/material.dart';

import '../../util/constants.dart';

Widget numberButton(BuildContext context, Widget icon, void Function() onTap) {
  return IconButton(
      onPressed: onTap,
      iconSize: kPad(context) * .2,
      icon: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: dark.withOpacity(0.1))),
        padding: EdgeInsets.all(kPad(context) * .07),
        child: icon,
      ));
}

Widget blueButton(BuildContext context, String label, void Function() onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: kPad(context) * .1,
      width: kPad(context) * .8,
      decoration:
          BoxDecoration(color: blue, borderRadius: BorderRadius.circular(7)),
      child: Center(
        child: Text(
          label,
          style: style(context)
              .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    ),
  );
}
