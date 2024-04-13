import 'package:flutter/material.dart';
import 'package:todo_list/provider/todo_provider.dart';

class CounterProvider with ChangeNotifier {
  late TaskProvider _taskProvider;

  CounterProvider(TaskProvider taskProvider) {
    _taskProvider = taskProvider;
    // Add the listener
    _taskProvider.addListener(_update);
  }

  int get totalCount => _taskProvider.todos.length;
  int get doneCount => _taskProvider.todos.where((todo) => todo.isDone).length;

  void update(TaskProvider taskProvider) {
    if (_taskProvider != taskProvider) {
      // Remove listener from the old instance before updating the reference
      _taskProvider.removeListener(_update);
      _taskProvider = taskProvider;
      // Add listener to the new instance
      _taskProvider.addListener(_update);
    }
    // Ensure listeners are notified in case other properties might have changed
    notifyListeners();
  }

  // Ensure to clean up to avoid memory leaks
  @override
  void dispose() {
    _taskProvider.removeListener(_update);
    super.dispose();
  }

  // Private method to notify listeners of updates
  void _update() {
    notifyListeners();
  }
}
