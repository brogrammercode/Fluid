import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:leaf_tutorial_todo/bloc/lock/lock_bloc.dart';
import 'package:leaf_tutorial_todo/repositories/lock_repository.dart';
import 'package:leaf_tutorial_todo/repositories/todo_repository.dart';
import 'package:leaf_tutorial_todo/ui/lock_screen.dart';
import 'package:leaf_tutorial_todo/util/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // We have to initialize the Hive Dependency
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => LockRepository()),
        RepositoryProvider(create: (context) => TodoRepository()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: BlocProvider(
          create: (context) => LockBloc(
            RepositoryProvider.of<LockRepository>(context),
            RepositoryProvider.of<TodoRepository>(context),
          )..add(HiveBoxOpeningEvent()),
          child: LockScreen(),
        ),
      ),
    );
  }
}

// LockScreen is working properly... :D
// in the next video we will be working with todoRepository and its Bloc Structure...



// So, the app is completed hope you learned something... Th
// anks for watching!!
