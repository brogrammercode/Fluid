import 'package:hive_flutter/adapters.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 2)
class TodoModel extends HiveObject {
  @HiveField(0)
  final int code;
  @HiveField(1)
  final int animationIndex;
  @HiveField(2)
  final String task;
  @HiveField(3)
  final int time;
  @HiveField(4)
  final int statusIndex;

  TodoModel(
      this.code, this.animationIndex, this.task, this.time, this.statusIndex);
}
