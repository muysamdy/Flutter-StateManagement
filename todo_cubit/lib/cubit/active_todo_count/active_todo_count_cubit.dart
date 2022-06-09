import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_cubit/cubit/todo_list/todo_list_cubit.dart';

import '../../model/todo_model.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  late final StreamSubscription todoListSubscription;
  final TodoListCubit todoListCubit;

  ActiveTodoCountCubit({required this.todoListCubit})
      : super(ActiveTodoCountState.initial()) {
    todoListSubscription = todoListCubit.stream.listen((TodoListState todoListState) {
      print("todoListState: $todoListState");

      final int currentActiveTodoCount =
          todoListState.todos.where((Todo todo) => !todo.completed).toList().length;

      emit(state.copyWith(activeTodoCount: currentActiveTodoCount));
    });
  }

  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
