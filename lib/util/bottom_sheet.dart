// for the bottom sheet dialog bar we will need...

import 'package:flutter/material.dart';
import 'package:leaf_tutorial_todo/util/constants.dart';

class PopUpClass {
  final String text;
  final IconData icon;
  final Color iconColor;
  final void Function() onTap;

  PopUpClass(this.text, this.icon, this.iconColor, this.onTap);
}

bottomSheetBar(BuildContext context, List<PopUpClass> list) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      useSafeArea: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(kPad(context) * .03),
          child: Container(
            // we will adjust the height of the dialog bar based on the number of options ...
            height:
                (kPad(context) * 0.05 + (list.length * (kPad(context) * .135))),
            decoration: BoxDecoration(
                color: white2, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: kPad(context) * .02),
                  child: Container(
                    height: kPad(context) * .01,
                    width: kPad(context) * .1,
                    decoration: BoxDecoration(
                        color: dark.withOpacity(.5),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                // we will continue it later when it will be needed...
                Expanded(
                    child: ListView.builder(
                        itemCount: list.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: list[index].onTap,
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                  bottom: BorderSide(
                                      color: dark.withOpacity(
                                          index == list.length - 1 ? 0 : .1)),
                                )),
                                padding: EdgeInsets.only(
                                    left: kPad(context) * .05,
                                    top: kPad(context) * .04,
                                    bottom: kPad(context) * .04),
                                child: Row(
                                  children: [
                                    Icon(
                                      list[index].icon,
                                      color: list[index].iconColor,
                                      size: kPad(context) * .05,
                                    ),
                                    SizedBox(
                                      width: kPad(context) * .05,
                                    ),
                                    Text(
                                      list[index].text,
                                      style: style(context).copyWith(
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ));
                        }))
              ],
            ),
          ),
        );
      });
}
