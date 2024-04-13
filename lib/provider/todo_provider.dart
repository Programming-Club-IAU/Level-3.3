import 'package:flutter/material.dart';
import 'package:todo_list/model/todo.dart';
import 'dart:collection';

class TaskProvider with ChangeNotifier {
  final List<Todo> _todos = [];

  UnmodifiableListView<Todo> get todos => UnmodifiableListView(_todos);

  void addTodo(String title) {
    final todo = Todo(id: DateTime.now().toString(), title: title);
    _todos.add(todo);
    notifyListeners();
  }

  void toggleTodoStatus(String id) {
    final todo = _todos.firstWhere((todo) => todo.id == id);
    todo.toggleDone();
    notifyListeners();
  }

  void deleteTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }

  void updateTodo(String id, String title) {
    final todo = _todos.firstWhere((todo) => todo.id == id);
    todo.title = title;
    notifyListeners();
  }
}
