part of 'active_todo_count_cubit.dart';

class ActiveTodoCountState extends Equatable {
  final int activeTodoCount;

  const ActiveTodoCountState({required this.activeTodoCount});

  factory ActiveTodoCountState.initial() =>
      const ActiveTodoCountState(activeTodoCount: 0);

  ActiveTodoCountState copyWith({int? activeTodoCount}) =>
      ActiveTodoCountState(activeTodoCount: activeTodoCount ?? this.activeTodoCount);

  @override
  String toString() => 'ActiveTodoCountState(activeTodoCount: $activeTodoCount)';

  @override
  List<Object> get props => [activeTodoCount];
}
