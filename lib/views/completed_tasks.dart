import 'package:flutter/material.dart';
import '../models/task.dart';

class CompletedTasksScreen extends StatefulWidget {
  final List<Task> completedTasks;
  final Function(Task) onUncompleteTask;

  const CompletedTasksScreen({
    Key? key,
    required this.completedTasks,
    required this.onUncompleteTask,
  }) : super(key: key);

  @override
  CompletedTasksScreenState createState() => CompletedTasksScreenState();
}

class CompletedTasksScreenState extends State<CompletedTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Completed Tasks')),
      body: ListView.builder(
        itemCount: widget.completedTasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.completedTasks[index].title),
            subtitle: Text(
                'Due: ${widget.completedTasks[index].dueDate.toLocal().toString().split(' ')[0]}'),
            trailing: IconButton(
              icon: const Icon(Icons.undo),
              onPressed: () {
                // Call the uncomplete task function
                widget.onUncompleteTask(widget.completedTasks[index]);
                Navigator.of(context).pop(); // Optionally pop the screen
              },
            ),
          );
        },
      ),
    );
  }
}
