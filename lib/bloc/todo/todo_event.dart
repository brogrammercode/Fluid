part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class LoadTodoListEvent extends TodoEvent {
  final int code;

  const LoadTodoListEvent(this.code);

  @override
  List<Object?> get props => [code];
}

class AddTodoEvent extends TodoEvent {
  final int code;
  final String task;
  final int animationIndex;

  const AddTodoEvent(this.code, this.task, this.animationIndex);

  @override
  List<Object?> get props => [code, task, animationIndex];
}

class MarkDoneEvent extends TodoEvent {
  final int code;
  final String task;
  final int time;
  final int animationIndex;
  final int statusIndex;

  const MarkDoneEvent(
      this.code, this.task, this.time, this.animationIndex, this.statusIndex);

  @override
  List<Object?> get props => [code, task, time, animationIndex, statusIndex];
}

class DeleteTaskEvent extends TodoEvent {
  final int code;
  final String task;

  const DeleteTaskEvent(this.code, this.task);

  @override
  List<Object?> get props => [code, task];
}

// for when the plus button on the add todo screen clicked

class AnimatedButtonClickedEvent extends TodoEvent {
  @override
  List<Object?> get props => [];
}

class AnimatedSelectedEvent extends TodoEvent {
  final int index;

  const AnimatedSelectedEvent(this.index);
  @override
  List<Object?> get props => [index];
}

// we will need some events that will trigger the todo_repository functions... -> LoadTodoListEvent, AddTodoEvent, MarkDoneEvent, DeleteTaskEvent...
