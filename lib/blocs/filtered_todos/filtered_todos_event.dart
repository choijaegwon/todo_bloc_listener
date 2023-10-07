part of 'filtered_todos_bloc.dart';

sealed class FilteredTodosEvent extends Equatable {
  const FilteredTodosEvent();

  @override
  List<Object> get props => [];
}

class CalculateFilteredTodoEvent extends FilteredTodosEvent {
  final List<Todo> filteredTodos;
  CalculateFilteredTodoEvent({
    required this.filteredTodos,
  });

  @override
  String toString() =>
      'CalculateFilteredTodoEvent(filteredTodos: $filteredTodos)';

  @override
  List<Object> get props => [filteredTodos];
}
