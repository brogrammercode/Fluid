import 'package:hive_flutter/hive_flutter.dart';

import '../models/todo_model.dart';

class TodoRepository {
  late Box<TodoModel> _todo;

  // This function is to initiate the hive database and create/ open the box for todo models...
  Future<void> init() async {
    Hive.registerAdapter(TodoModelAdapter());
    _todo = await Hive.openBox<TodoModel>('todo_box');
  }

  // we will work on them on another video...
  getTodos() {}

  addTodos() {}

  removeTodos() {}

  updateTodos() {}
}
