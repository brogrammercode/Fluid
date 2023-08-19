import 'package:flutter/material.dart';
import 'package:leaf_tutorial_todo/util/constants.dart';

fullScreenBottomSheet(BuildContext context, Widget child) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height,
          width: kPad(context),
          decoration: const BoxDecoration(
              color: white2,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: kPad(context) * .02),
                  child: Center(
                    child: Container(
                      height: kPad(context) * .01,
                      width: kPad(context) * .15,
                      decoration: BoxDecoration(
                          color: dark.withOpacity(.5),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                child
              ],
            ),
          ),
        );
      });
}
