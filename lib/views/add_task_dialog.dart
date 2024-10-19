import 'package:flutter/material.dart';
import 'package:todo_app_flutter/models/task.dart';

class AddTaskDialog extends StatefulWidget {
  final Function(Task) onAddTask;

  const AddTaskDialog({Key? key, required this.onAddTask}) : super(key: key);

  @override
  AddTaskDialogState createState() => AddTaskDialogState();
}

class AddTaskDialogState extends State<AddTaskDialog> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _selectedDate;

  void _selectDueDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _submitTask() {
    // Retrieve the title and description from the text controllers
    String title = _titleController.text;
    String description = _descriptionController.text;

    // Create a new Task object using the user input
    Task newTask = Task(
      title: title,
      description: description,
      dueDate:
          _selectedDate ?? DateTime.now(), // Use selected date or current date
      isCompleted: false,
    );

    widget.onAddTask(newTask); // Call the callback function
    Navigator.of(context).pop(); // Close the dialog
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Task Title'),
          ),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
          ElevatedButton(
            onPressed: () => _selectDueDate(context),
            child: Text(_selectedDate == null
                ? 'Select Due Date'
                : _selectedDate!.toLocal().toString().split(' ')[0]),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: _submitTask,
          child: const Text('Add'),
        ),
      ],
    );
  }
}
