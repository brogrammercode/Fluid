import 'package:hive_flutter/hive_flutter.dart';
import 'package:leaf_tutorial_todo/ui/widgets/toast_notification.dart';

import '../models/todo_model.dart';

class TodoRepository {
  late Box<TodoModel> _todo;

  // This function is to initiate the hive database and create/ open the box for todo models...
  Future<void> init() async {
    Hive.registerAdapter(TodoModelAdapter());
    _todo = await Hive.openBox<TodoModel>('todo_box');
  }

  // to get the todo list according to the code
  List<TodoModel> getTodos(final int code) {
    final todos = _todo.values.where((element) => element.code == code);
    return todos.toList();
  }

  // to add the task to the list according to the respective code...
  void addTodos(final int code, final int animationIndex, final String task,
      final int time, final int statusIndex) {
    _todo
        .add(TodoModel(code, animationIndex, task, time, statusIndex))
        .whenComplete(() => showToast('$task added successfully'));
  }

  // to remove the task
  Future<void> removeTodos(final int code, final String task) async {
    final taskToRemove = _todo.values
        .firstWhere((element) => element.code == code && element.task == task);
    await taskToRemove
        .delete()
        .whenComplete(() => showToast('$task deleted successfully'));
  }

  // to update the task status ( if it is completed / working on it / not completed)
  Future<void> updateTodos(final int code, final String task,
      final int animationIndex, final int time, final int statusIndex) async {
    final taskToEdit = _todo.values
        .firstWhere((element) => element.code == code && element.task == task);

    // it will provide a particular key for that particular task...
    final index = taskToEdit.key as int;

    await _todo
        .put(index, TodoModel(code, animationIndex, task, time, statusIndex))
        .whenComplete(() => showToast('$task updated successfully'));
  }
}

// till then let's make another widget...
