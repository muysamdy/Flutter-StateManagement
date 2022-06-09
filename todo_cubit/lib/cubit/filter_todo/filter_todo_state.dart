part of 'filter_todo_cubit.dart';

class FilterTodoState extends Equatable {
  final List<Todo> filteredTodos;

  const FilterTodoState({required this.filteredTodos});

  factory FilterTodoState.initial() => const FilterTodoState(filteredTodos: []);

  FilterTodoState copyWith({List<Todo>? filteredTodos}) =>
      FilterTodoState(filteredTodos: filteredTodos ?? this.filteredTodos);

  @override
  String toString() => 'FilterTodoState(filteredTodos: $filteredTodos)';

  @override
  List<Object> get props => [filteredTodos];
}
