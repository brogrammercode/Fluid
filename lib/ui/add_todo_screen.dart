import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:leaf_tutorial_todo/repositories/todo_repository.dart';
import 'package:leaf_tutorial_todo/ui/todo_screen.dart';
import 'package:leaf_tutorial_todo/ui/widgets/buttons.dart';
import 'package:leaf_tutorial_todo/ui/widgets/custom_textfield.dart';
import 'package:leaf_tutorial_todo/util/constants.dart';
import 'package:lottie/lottie.dart';

import '../bloc/todo/todo_bloc.dart';
import '../util/navigator.dart';

class AddTodoScreen extends StatelessWidget {
  final int code;

  AddTodoScreen({super.key, required this.code});

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoBloc, TodoState>(
      listener: (context, state) {
        // implement listener
        if (state is PopState) {
          popUntilFirstPage(context);
          replace(
              context,
              BlocProvider(
                create: (context) => TodoBloc(
                  RepositoryProvider.of<TodoRepository>(context),
                )..add(LoadTodoListEvent(code)),
                child: TodoScreen(code: code),
              ));
        }
      },
      builder: (context, state) {
        if (state is AnimationGridState) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: kPad(context) * .05),
                child: Text(
                  'Choose an animation',
                  style: style(context).copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: kPad(context) * .04),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kPad(context) * .1),
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 15,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: kPad(context) * .05,
                        mainAxisSpacing: kPad(context) * .05),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          BlocProvider.of<TodoBloc>(context)
                              .add(AnimatedSelectedEvent(index + 1));
                        },
                        child: Container(
                          height: kPad(context) * .35,
                          width: kPad(context) * .35,
                          decoration: BoxDecoration(
                              color: blue.withOpacity(.1),
                              borderRadius: BorderRadius.circular(7)),
                          padding: EdgeInsets.all(kPad(context) * .05),
                          child: Lottie.asset('assets/${index + 1}.json',
                              repeat: true, reverse: true),
                        ),
                      );
                    }),
              )
            ],
          );
        }

        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: kPad(context) * .05),
              child: Text(
                'Add a task',
                style: style(context).copyWith(
                    fontWeight: FontWeight.w500, fontSize: kPad(context) * .04),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: kPad(context) * .05,
                  vertical: kPad(context) * .1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      // to trigger AnimatedButtonClicked
                      BlocProvider.of<TodoBloc>(context)
                          .add(AnimatedButtonClickedEvent());
                    },
                    child: Container(
                      height: kPad(context) * .35,
                      width: kPad(context) * .35,
                      decoration: BoxDecoration(
                          color: blue.withOpacity(.1),
                          borderRadius: BorderRadius.circular(7)),
                      padding: EdgeInsets.all(kPad(context) * .05),
                      child: state.index == 0
                          ? Icon(
                              Iconsax.add,
                              size: kPad(context) * .07,
                              color: blue,
                            )
                          : Lottie.asset('assets/${state.index}.json',
                              repeat: true, reverse: true),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Task Date',
                        style: style(context)
                            .copyWith(fontWeight: FontWeight.w500, color: blue),
                      ),
                      Text(
                        DateFormat('dd MMM, yy').format(DateTime.now()),
                        style: style(context).copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: kPad(context) * .06),
                      ),
                      SizedBox(
                        height: kPad(context) * .05,
                      ),
                      Text(
                        'Status',
                        style: style(context)
                            .copyWith(fontWeight: FontWeight.w500, color: blue),
                      ),
                      SizedBox(
                        height: kPad(context) * .01,
                      ),
                      Text(
                        'Not Completed',
                        style: style(context).copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.redAccent),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kPad(context) * .0),
              child: customTextField(
                  context, _controller, 'Enter your Task', (p0) {}, false),
            ),
            SizedBox(
              height: kPad(context) * .1,
            ),
            blueButton(context, 'Submit', () {
              // to finally submit the task with some parameters
              BlocProvider.of<TodoBloc>(context)
                  .add(AddTodoEvent(code, _controller.text, state.index));
            }),
          ],
        );
      },
    );
  }
}

// So task is adding successfully...

// Let's add a toast(flutter-toast) for the add task notification...

// add the dependency -> fluttertoast: ^8.2.2

// if you face any error then
// 1. flutter clean
// 2. flutter pub get
// 3. the re-run the Application...
