part of 'todo_search_cubit.dart';

class TodoSearchState extends Equatable {
  final String searchTerm;

  const TodoSearchState({required this.searchTerm});

  factory TodoSearchState.initial() => const TodoSearchState(searchTerm: "");

  TodoSearchState copyWith({String? searchTerm}) =>
      TodoSearchState(searchTerm: searchTerm ?? this.searchTerm);

  @override
  String toString() => 'TodoSearchState(searchTerm: $searchTerm)';

  @override
  List<Object> get props => [searchTerm];
}
