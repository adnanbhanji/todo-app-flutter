import 'package:flutter/material.dart';
import 'views/pending_tasks.dart';
import 'controllers/task_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key); // Added key parameter
  final TaskController taskController = TaskController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PendingTasksScreen(pendingTasks: taskController.pendingTasks),
    );
  }
}
