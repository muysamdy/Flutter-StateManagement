import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

enum Filter { all, active, completed }

class Todo extends Equatable {
  Todo({
    String? id,
    this.completed = false,
    required this.desc,
  }) : this.id = id ?? uuid.v4();

  final String id;
  final String desc;
  final bool completed;

  @override
  String toString() => 'Todo(id: $id, desc: $desc, completed: $completed)';

  @override
  List<Object> get props => [id, desc, completed];
}
