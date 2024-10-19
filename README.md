# Todo App Flutter

This is a simple Todo application built with Flutter. It allows users to manage their tasks by adding, completing, and viewing pending and completed tasks.

## File Structure

### 1. `lib/main.dart`

This is the entry point of the application.

- **Main Function**: Initializes the app and sets up the `MyApp` widget.
- **MyApp Class**:
  - Sets up the MaterialApp with a title and theme.
  - Passes the pending and completed tasks to the `PendingTasksScreen`.

### 2. `lib/controllers/task_controller.dart`

This file contains the `TaskController` class, which manages the list of tasks.

- **TaskController Class**:
  - Holds a private list of tasks.
  - Provides getters for pending and completed tasks.
  - Methods to add, complete, and uncomplete tasks.

### 3. `lib/models/task.dart`

Defines the `Task` model.

- **Task Class**:
  - Contains properties: `title`, `description`, `dueDate`, and `isCompleted`.
  - Constructor to initialize a task with required fields.

### 4. `lib/views/pending_tasks.dart`

This file contains the UI for displaying pending tasks.

- **PendingTasksScreen Class**:

  - Takes lists of pending and completed tasks as parameters.
  - Displays a list of pending tasks with options to complete them.
  - Provides a floating action button to add new tasks.

- **PendingTasksScreenState Class**:
  - Manages the state of the pending tasks.
  - Handles adding and uncompleting tasks.

### 5. `lib/views/completed_tasks.dart`

This file contains the UI for displaying completed tasks.

- **CompletedTasksScreen Class**:
  - Takes a list of completed tasks and a callback to uncomplete tasks.
  - Displays a list of completed tasks with an option to move them back to pending.

### 6. `lib/views/add_task_dialog.dart`

This file provides a dialog for adding new tasks.

- **AddTaskDialog Class**:
  - Contains text fields for task title and description.
  - Allows users to select a due date.
  - Validates input and calls the provided callback to add the task.

## Usage

1. Clone the repository.
2. Run `flutter pub get` to install dependencies.
3. Use `flutter run` to start the application.

## Features

- Add new tasks with a title, description, and due date.
- View pending tasks and mark them as completed.
- View completed tasks and uncomplete them if necessary.
- Responsive UI with a floating action button for adding tasks.
