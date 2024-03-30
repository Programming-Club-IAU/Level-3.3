# Week 4: Introduction to State Management

## Overview

This week you will be learning about state management in Flutter. We will be focusing on the `provider` library and how to use it as a state management tool for your app.

## Learning Objectives

* Understand the concept of state management
* Understand the difference between stateful and stateless widgets
* Understand how to use the `provider` library to manage state in your app

## Resources

* [Provider Package](https://pub.dev/packages/provider)
* [Simple State Management | Flutter](https://docs.flutter.dev/data-and-backend/state-mgmt/simple)
* [Provider Introduction | Video](https://www.youtube.com/watch?v=uQuxrZE2dqA)

## Project Overview

This week you will create a simple todo list app using flutter. The app must use the provider library.

## Important Concepts

### Setting up the Provider

To use the provider library, you must first add it to your `pubspec.yaml` file. You can do this by adding the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider:
```

Not providing a version will automatically fetch the latest version.

### Creating a Provider

To create a provider, you must first create a class that extends `ChangeNotifier`. This class will be the provider for your app.

```dart
class MyProvider extends ChangeNotifier {
  // ...
}
```

### Using a Provider

To use a provider, you must first create an instance of the provider in your app. This is usually done in the `main.dart` file.

```dart
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: MyApp(),
    ),
  );
}
```

If you have multiple providers

```dart
    void main() {
      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => MyProvider()),
            ChangeNotifierProvider(create: (context) => MyOtherProvider()),
          ],
          child: MyApp(),
        ),
      );
    }
```

### Accessing a Provider

To access a provider, you must first create a `Consumer` widget. This widget will listen to the provider and rebuild when the provider changes.

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, myProvider, child) {
        return Text(myProvider.someValue);
      },
    );
  }
}
```

### Updating a Provider

To update a provider, you must call the `notifyListeners()` method on the provider. This will notify all the listeners of the provider to rebuild.

```dart
class MyProvider extends ChangeNotifier {
  String _someValue = 'Hello World';

  String get someValue => _someValue;

  void updateSomeValue(String newValue) {
    _someValue = newValue;
    notifyListeners();
  }
}
```

## Task: Create a Todo List App

This week you will be creating a simple todo list app. The app must use the provider library to manage state.

### Requirements

* All CRUD Operations must be applicable in the todo list (Create, Read, Update, Delete)
* The app must use the provider library to manage state
* Change the readme to document your app!

### Bonus

* Add a splash screen to your app
* Add a dark mode to your app
* Make a cool UI for your app

### UI Inspiration

![Image1](https://cdn.dribbble.com/users/5126936/screenshots/12238011/web_1920___1.png)
![Image2](https://cdn.dribbble.com/users/275567/screenshots/6576091/todoapp_4x.png)
![Image3](https://cdn.dribbble.com/users/2806924/screenshots/5642001/todo_app_4x.png)
