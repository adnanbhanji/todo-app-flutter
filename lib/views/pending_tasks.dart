import 'package:flutter/material.dart';
import '../models/task.dart';
import 'add_task_dialog.dart';

class PendingTasksScreen extends StatefulWidget {
  final List<Task> pendingTasks;

  const PendingTasksScreen({Key? key, required this.pendingTasks})
      : super(key: key);

  @override
  _PendingTasksScreenState createState() => _PendingTasksScreenState();
}

class _PendingTasksScreenState extends State<PendingTasksScreen> {
  late List<Task> _pendingTasks;

  @override
  void initState() {
    super.initState();
    _pendingTasks = widget.pendingTasks;
  }

  void _addTask(Task newTask) {
    setState(() {
      _pendingTasks.add(newTask); // Add the new task to the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pending Tasks')),
      body: ListView.builder(
        itemCount: _pendingTasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_pendingTasks[index].title),
            subtitle: Text(
                'Due: ${_pendingTasks[index].dueDate.toLocal().toString().split(' ')[0]}'),
            trailing: Checkbox(
              value: _pendingTasks[index].isCompleted,
              onChanged: (bool? value) {
                // Handle task completion
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AddTaskDialog(onAddTask: _addTask); // Pass the callback
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
