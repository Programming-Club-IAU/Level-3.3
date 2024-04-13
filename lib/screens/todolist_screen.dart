import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/todo.dart';
import 'package:todo_list/provider/todo_provider.dart';
import 'package:todo_list/provider/theme_provider.dart';
import 'package:todo_list/provider/counter_provider.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.brightness_4),
            onPressed: () => Provider.of<ThemeProvider>(context, listen: false)
                .toggleTheme(),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<CounterProvider>(
              builder: (context, counter, child) => Text(
                  'Total Tasks: ${counter.totalCount}, Completed: ${counter.doneCount}'),
            ),
          ),
          Expanded(
            child: Consumer<TaskProvider>(
              builder: (context, taskProvider, child) => ListView.builder(
                itemCount: taskProvider.todos.length,
                itemBuilder: (context, index) {
                  final todo = taskProvider.todos[index];
                  return ListTile(
                    title: Text(todo.title),
                    leading: Checkbox(
                      value: todo.isDone,
                      onChanged: (bool? value) {
                        taskProvider.toggleTodoStatus(todo.id);
                      },
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () =>
                              _editTodoDialog(context, todo, taskProvider),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => taskProvider.deleteTodo(todo.id),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTodoDialog(context),
        backgroundColor: const Color.fromARGB(255, 82, 234, 87),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40.0,
        ),
      ),
    );
  }

  Future<void> _addTodoDialog(BuildContext context) async {
    TextEditingController _textFieldController = TextEditingController();
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Task'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: "Enter task title"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                if (_textFieldController.text.isNotEmpty) {
                  Provider.of<TaskProvider>(context, listen: false)
                      .addTodo(_textFieldController.text);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _editTodoDialog(
      BuildContext context, Todo todo, TaskProvider taskProvider) async {
    TextEditingController _textFieldController =
        TextEditingController(text: todo.title);
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Task'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: "Update task title"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Update'),
              onPressed: () {
                if (_textFieldController.text.isNotEmpty) {
                  taskProvider.updateTodo(todo.id, _textFieldController.text);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
