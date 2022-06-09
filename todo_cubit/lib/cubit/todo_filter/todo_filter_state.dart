part of 'todo_filter_cubit.dart';

enum TodoFilterStatus { initial, loading, success, failure }

class TodoFilterState extends Equatable {
  const TodoFilterState({required this.filter});

  final Filter filter;

  TodoFilterState copyWith({Filter? filter}) =>
      TodoFilterState(filter: filter ?? this.filter);

  factory TodoFilterState.initial() => const TodoFilterState(filter: Filter.all);

  @override
  String toString() => 'TodoFilterState(filter: $filter)';

  @override
  List<Object> get props => [filter];
}
