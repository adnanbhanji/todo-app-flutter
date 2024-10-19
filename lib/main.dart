import 'package:flutter/material.dart';
import 'views/pending_tasks.dart';
import 'models/task.dart';

void main() {
  runApp(const MyApp()); // Added 'const' keyword
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Added key parameter

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PendingTasksScreen(
          pendingTasks: []), // Changed null to an empty list
    );
  }
}
