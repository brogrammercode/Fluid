import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/todo_model.dart';
import '../../repositories/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _todoRepository;
  TodoBloc(this._todoRepository) : super(const TodoInitial(0)) {
    // add todo bloc...
    on<AddTodoEvent>((event, emit) async {
      _todoRepository.addTodos(event.code, event.animationIndex, event.task,
          DateTime.now().millisecondsSinceEpoch, 0);
      emit(const PopState(0));
    });

    // animated button clicked bloc...
    on<AnimatedButtonClickedEvent>((event, emit) {
      emit(const AnimationGridState(0));
    });

    on<AnimatedSelectedEvent>((event, emit) {
      emit(TodoInitial(event.index));
    });

    // load todo bloc
    on<LoadTodoListEvent>((event, emit) async {
      final todos = _todoRepository.getTodos(event.code);
      emit(LoadedTodoListState(0, event.code, todos));
    });

    // mark done bloc
    on<MarkDoneEvent>((event, emit) async {
      await _todoRepository.updateTodos(event.code, event.task,
          event.animationIndex, event.time, event.statusIndex);
      add(LoadTodoListEvent(event.code));
      emit(const PopState(0));
    });

    // delete task bloc
    on<DeleteTaskEvent>((event, emit) async {
      await _todoRepository.removeTodos(event.code, event.task);
      add(LoadTodoListEvent(event.code));
      emit(const PopState(0));
    });
  }
}
