import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'todo.dart';

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  void addTodo(String name) {
    final newTodo = Todo(
      id: DateTime.now().toString(),
      name: name,
    );
    state = [...state, newTodo];
  }

  void removeTodoById(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}

final todoProvider = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) {
  return TodoNotifier();
});
