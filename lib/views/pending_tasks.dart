import 'package:flutter/material.dart';
import '../models/task.dart';
import 'add_task_dialog.dart';
import 'completed_tasks.dart';

class PendingTasksScreen extends StatefulWidget {
  final List<Task> pendingTasks;
  final List<Task> completedTasks;

  const PendingTasksScreen({
    Key? key,
    required this.pendingTasks,
    required this.completedTasks,
  }) : super(key: key);

  @override
  PendingTasksScreenState createState() => PendingTasksScreenState();
}

class PendingTasksScreenState extends State<PendingTasksScreen> {
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

  void _uncompleteTask(Task task) {
    setState(() {
      task.isCompleted = false; // Set the task as not completed
      _pendingTasks.add(task); // Move the task back to pending
      widget.completedTasks.remove(task); // Remove from completed tasks
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending Tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_circle),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CompletedTasksScreen(
                    completedTasks: widget.completedTasks,
                    onUncompleteTask: _uncompleteTask,
                  ),
                ),
              );
            },
          ),
        ],
      ),
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
                setState(() {
                  // Move the task to completed tasks
                  _pendingTasks[index].isCompleted = true;
                  widget.completedTasks.add(_pendingTasks[index]);
                  _pendingTasks.removeAt(index);
                });
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
