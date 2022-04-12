import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/models/todo_model.dart';

class TodoNotifier extends StateNotifier<List<TodoModel>> {
  TodoNotifier() : super([]) {
    // loadData();
  }

  loadData() {
    // state.addAll(todoList);
    // state = [...state];
    state = [...state..addAll(todoList)];
  }

  addTodo(TodoModel todo) {
    state = [...state..add(todo)];
  }

  idList() {
    return state.map((e) => e.id).toList();
  }
}

final todoProvider =
    StateNotifierProvider<TodoNotifier, List<TodoModel>>((ref) {
  return TodoNotifier();
});
