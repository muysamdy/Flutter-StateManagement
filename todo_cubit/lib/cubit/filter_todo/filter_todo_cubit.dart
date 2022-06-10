import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_cubit/cubit/todo_filter/todo_filter_cubit.dart';
import 'package:todo_cubit/cubit/todo_list/todo_list_cubit.dart';
import 'package:todo_cubit/cubit/todo_search/todo_search_cubit.dart';
import 'package:todo_cubit/model/todo_model.dart';

part 'filter_todo_state.dart';

class FilterTodoCubit extends Cubit<FilterTodoState> {
  final TodoFilterCubit todoFilterCubit;
  final TodoSearchCubit todoSearchCubit;
  final TodoListCubit todoListCubit;
  final List<Todo> initialTodos;

  late StreamSubscription todoFilterSubscription;
  late StreamSubscription todoSearchSubscription;
  late StreamSubscription todoListSubscription;

  FilterTodoCubit({
    required this.initialTodos,
    required this.todoFilterCubit,
    required this.todoSearchCubit,
    required this.todoListCubit,
  }) : super(FilterTodoState(filteredTodos: initialTodos)) {
    todoFilterSubscription = todoFilterCubit.stream
        .listen((TodoFilterState todoFilterState) => setFilteredTodos());

    todoSearchSubscription = todoSearchCubit.stream
        .listen((TodoSearchState todoSearchState) => setFilteredTodos());

    todoListSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) => setFilteredTodos());
  }

  void setFilteredTodos() {
    List<Todo> _filteredTodos;

    switch (todoFilterCubit.state.filter) {
      case Filter.active:
        _filteredTodos =
            todoListCubit.state.todos.where((Todo todo) => !todo.completed).toList();
        break;

      case Filter.completed:
        _filteredTodos =
            todoListCubit.state.todos.where((Todo todo) => todo.completed).toList();
        break;

      case Filter.all:
      default:
        _filteredTodos = todoListCubit.state.todos;
        break;
    }
    if (todoSearchCubit.state.searchTerm.isNotEmpty) {
      _filteredTodos = _filteredTodos
          .where((Todo todo) =>
              todo.desc.toLowerCase().contains(todoSearchCubit.state.searchTerm))
          .toList();
    }
    emit(state.copyWith(filteredTodos: _filteredTodos));
  }

  @override
  Future<void> close() {
    todoFilterSubscription.cancel();
    return super.close();
  }
}
