import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:leaf_tutorial_todo/repositories/todo_repository.dart';
import 'package:leaf_tutorial_todo/ui/add_todo_screen.dart';
import 'package:leaf_tutorial_todo/ui/lock_screen.dart';
import 'package:leaf_tutorial_todo/ui/widgets/custom_app_bar.dart';
import 'package:leaf_tutorial_todo/ui/widgets/fullScreenBottomSheet.dart';
import 'package:leaf_tutorial_todo/util/constants.dart';
import 'package:leaf_tutorial_todo/util/navigator.dart';
import 'package:lottie/lottie.dart';

import '../bloc/lock/lock_bloc.dart';
import '../bloc/todo/todo_bloc.dart';
import '../repositories/lock_repository.dart';
import '../util/bottom_sheet.dart';

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
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: kPad(context) * 0.2,
                ),
                BlocConsumer<TodoBloc, TodoState>(
                  listener: (context, state) {
                    // ...
                    if (state is PopState) {
                      pop(context);
                      BlocProvider.of<TodoBloc>(context)
                          .add(LoadTodoListEvent(code));
                    }
                  },
                  builder: (context, state) {
                    if (state is LoadedTodoListState) {
                      return ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        reverse: true,
                        children: [
                          ...state.todos.map((e) => InkWell(
                                onTap: () {
                                  // to open the bottom sheet dialog bar... Let's continue our bottom widget...
                                  bottomSheetBar(context, [
                                    PopUpClass('Mark as Done', Iconsax.award,
                                        Colors.green, () {
                                      BlocProvider.of<TodoBloc>(context).add(
                                          MarkDoneEvent(e.code, e.task, e.time,
                                              e.animationIndex, 2));
                                    }),
                                    PopUpClass('Mark as Working on it',
                                        Iconsax.like_1, Colors.orange, () {
                                      BlocProvider.of<TodoBloc>(context).add(
                                          MarkDoneEvent(e.code, e.task, e.time,
                                              e.animationIndex, 1));
                                    }),
                                    PopUpClass(
                                        'Delete this Task', Iconsax.trash, dark,
                                        () {
                                      BlocProvider.of<TodoBloc>(context)
                                          .add(DeleteTaskEvent(code, e.task));
                                    }),
                                    PopUpClass('Mark as Not Completed',
                                        Iconsax.moon, Colors.red, () {
                                      BlocProvider.of<TodoBloc>(context).add(
                                          MarkDoneEvent(e.code, e.task, e.time,
                                              e.animationIndex, 0));
                                    }),
                                  ]);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: kPad(context) * .03,
                                      horizontal: kPad(context) * .05),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: dark.withOpacity(.1)),
                                        borderRadius: BorderRadius.circular(7)),
                                    padding:
                                        EdgeInsets.all(kPad(context) * .05),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: kPad(context) * .3,
                                          width: kPad(context) * .3,
                                          decoration: BoxDecoration(
                                              color: blue.withOpacity(.1),
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: Lottie.asset(
                                              'assets/${e.animationIndex}.json',
                                              reverse: true,
                                              repeat: true),
                                        ),
                                        SizedBox(
                                          width: kPad(context) * .05,
                                        ),
                                        Expanded(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: kPad(context) * .26,
                                              width: kPad(context) * .5,
                                              child: Text(
                                                e.task,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 4,
                                                style: style(context).copyWith(
                                                  fontSize: kPad(context) * .04,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  DateFormat('dd MMM, yy')
                                                      .format(DateTime
                                                          .fromMillisecondsSinceEpoch(
                                                              e.time))
                                                      .toString(),
                                                  style:
                                                      style(context).copyWith(
                                                    fontSize:
                                                        kPad(context) * .03,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height:
                                                          kPad(context) * .02,
                                                      width:
                                                          kPad(context) * .02,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: e.statusIndex ==
                                                                  0
                                                              ? Colors.red
                                                              : e.statusIndex ==
                                                                      1
                                                                  ? Colors
                                                                      .orangeAccent
                                                                  : Colors
                                                                      .green),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          kPad(context) * .01,
                                                    ),
                                                    Text(
                                                      e.statusIndex == 0
                                                          ? 'Not Completed'
                                                          : e.statusIndex == 1
                                                              ? 'Working on it'
                                                              : 'Done',
                                                      style: style(context)
                                                          .copyWith(
                                                              fontSize: kPad(
                                                                      context) *
                                                                  .03,
                                                              color: dark
                                                                  .withOpacity(
                                                                      .5)),
                                                    )
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ))
                                      ],
                                    ),
                                  ),
                                ),
                              )) // --> this is the task-box widget, you can extract as a one widget or leave it...
                          // let's make a Task Box for it
                        ],
                      );
                    }
                    return const SizedBox.shrink();
                  },
                )
              ],
            ),
          ),
        ),
        Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: customAppBar(
                context, 'All Tasks', CupertinoIcons.left_chevron, Iconsax.add,
                () {
              replace(
                  context,
                  BlocProvider(
                    create: (context) => LockBloc(
                      RepositoryProvider.of<LockRepository>(context),
                      RepositoryProvider.of<TodoRepository>(context),
                    )..add(
                        HiveBoxOpeningEvent(),
                      ),
                    child: const LockScreen(),
                  ));
            }, () {
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
