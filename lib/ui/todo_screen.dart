import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:leaf_tutorial_todo/repositories/todo_repository.dart';
import 'package:leaf_tutorial_todo/ui/add_todo_screen.dart';
import 'package:leaf_tutorial_todo/ui/widgets/custom_app_bar.dart';
import 'package:leaf_tutorial_todo/ui/widgets/fullScreenBottomSheet.dart';
import 'package:leaf_tutorial_todo/util/constants.dart';

import '../bloc/todo/todo_bloc.dart';

class TodoScreen extends StatelessWidget {
  final int code;
  const TodoScreen({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: kPad(context),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: kPad(context) * 0.2,
                ),
                Text(
                  'Todo Screen',
                  style: style(context),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: customAppBar(context, 'All Tasks',
                CupertinoIcons.left_chevron, Iconsax.add, () {}, () {
              // bottom sheet
              fullScreenBottomSheet(
                  context,
                  BlocProvider(
                    create: (context) => TodoBloc(
                      RepositoryProvider.of<TodoRepository>(context),
                    ),
                    child: AddTodoScreen(
                      code: code,
                    ),
                  ));
            })),
      ],
    ));
  }
}
