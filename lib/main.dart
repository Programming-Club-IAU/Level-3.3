import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/provider/todo_provider.dart';
import 'package:todo_list/screens/todolist_screen.dart';
import 'package:todo_list/provider/theme_provider.dart';
import 'package:todo_list/provider/counter_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => TaskProvider()),
        ChangeNotifierProxyProvider<TaskProvider, CounterProvider>(
          create: (context) => CounterProvider(
              Provider.of<TaskProvider>(context, listen: false)),
          update: (context, taskProvider, counterProvider) =>
              counterProvider!..update(taskProvider),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:
                themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            home: const TodoListScreen(),
          );
        },
      ),
    );
  }
}
