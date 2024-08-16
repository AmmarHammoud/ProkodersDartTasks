class Task {
  late String text;
  late bool completed;

  Task({required this.text, this.completed = false});

  markAsCompleted() {
    completed = true;
  }
}
