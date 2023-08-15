import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:leaf_tutorial_todo/ui/todo_screen.dart';
import 'package:leaf_tutorial_todo/ui/widgets/buttons.dart';
import 'package:leaf_tutorial_todo/ui/widgets/custom_app_bar.dart';
import 'package:leaf_tutorial_todo/util/navigator.dart';

import '../util/constants.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  int _code = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        customAppBar(context, 'Enter the Code', Iconsax.home3, Iconsax.home3,
            () {}, () {}),
        Expanded(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: kPad(context) * 0.2),
                  child: Text(
                    _code.toString(),
                    style: style(context).copyWith(
                        fontSize: kPad(context) * .1,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kPad(context) * 0.05),
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 9,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 1.3),
                    itemBuilder: (context, index) {
                      return numberButton(
                          context,
                          Text(
                            '${index + 1}',
                            style: style(context)
                                .copyWith(fontSize: kPad(context) * 0.05),
                          ), () {
                        setState(() {
                          _code = (_code * 10) + (index + 1);
                        });
                      });
                    }),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kPad(context) * .08),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    numberButton(
                        context,
                        Icon(
                          CupertinoIcons.delete_left,
                          size: kPad(context) * .05,
                          color: Colors.red,
                        ), () {
                      setState(() {
                        _code = (_code ~/ 10);
                      });
                    }),
                    numberButton(
                        context,
                        Text(
                          '0',
                          style: style(context)
                              .copyWith(fontSize: kPad(context) * 0.05),
                        ), () {
                      setState(() {
                        _code = (_code * 10) + 0;
                      });
                    }),
                    numberButton(
                        context,
                        Icon(
                          CupertinoIcons.check_mark,
                          size: kPad(context) * .05,
                          color: Colors.green,
                        ), () {
                      push(context, TodoScreen());
                    }),
                  ],
                ),
              ),
              SizedBox(
                height: kPad(context) * .1,
              ),
              blueButton(context, 'Register Instead', () {}),
            ],
          ),
        ),
      ],
    ));
  }
}

// Now we will setup our lock repository and todo repository along with the bloc setup...
