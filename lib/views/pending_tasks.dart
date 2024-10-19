import 'package:flutter/material.dart';
import '../models/task.dart';

class PendingTasksScreen extends StatelessWidget {
  final List<Task> pendingTasks;

  const PendingTasksScreen({Key? key, required this.pendingTasks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pending Tasks')),
      body: ListView.builder(
        itemCount: pendingTasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pendingTasks[index].title),
            subtitle: Text(
                'Due: ${pendingTasks[index].dueDate.toLocal().toString().split(' ')[0]}'),
            trailing: Checkbox(
              value: pendingTasks[index].isCompleted,
              onChanged: (bool? value) {
                // Handle task completion
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open add task dialog
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
