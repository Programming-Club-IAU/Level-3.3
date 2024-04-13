class Todo {
  String id;
  String title;
  bool isDone;

  Todo({required this.id, required this.title, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
