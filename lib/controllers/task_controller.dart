import '../models/task.dart';

class TaskController {
  final List<Task> _tasks = [];

  List<Task> get pendingTasks =>
      _tasks.where((task) => !task.isCompleted).toList();
  List<Task> get completedTasks =>
      _tasks.where((task) => task.isCompleted).toList();

  void addTask(Task task) {
    _tasks.add(task);
  }

  void completeTask(Task task) {
    task.isCompleted = true;
  }

  void uncompleteTask(Task task) {
    task.isCompleted = false;
  }
}
