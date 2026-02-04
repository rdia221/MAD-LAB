import 'dart:io';

void main() {
  List<String> tasks = [];

  while (true) {
    print('\n--- TO-DO LIST APP ---');
    print('1. Add Task');
    print('2. View Tasks');
    print('3. Remove Task');
    print('4. Exit');
    stdout.write('Enter your choice: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        addTask(tasks);
        break;

      case '2':
        viewTasks(tasks);
        break;

      case '3':
        removeTask(tasks);
        break;

      case '4':
        print('Goodbye! 👋');
        return;

      default:
        print('Invalid choice! Please enter 1–4.');
    }
  }
}

// Function to add a task
void addTask(List<String> tasks) {
  stdout.write('Enter task: ');
  String? task = stdin.readLineSync();

  if (task == null || task.trim().isEmpty) {
    print('Task cannot be empty.');
  } else {
    tasks.add(task);
    print('Task added successfully!');
  }
}

// Function to view tasks
void viewTasks(List<String> tasks) {
  if (tasks.isEmpty) {
    print('No tasks available.');
  } else {
    print('\nYour Tasks:');
    for (int i = 0; i < tasks.length; i++) {
      print('$i: ${tasks[i]}');
    }
  }
}

// Function to remove a task
void removeTask(List<String> tasks) {
  if (tasks.isEmpty) {
    print('No tasks to remove.');
    return;
  }

  viewTasks(tasks);
  stdout.write('Enter index of task to remove: ');
  String? input = stdin.readLineSync();

  int? index = int.tryParse(input ?? '');

  if (index == null || index < 0 || index >= tasks.length) {
    print('Invalid index!');
  } else {
    tasks.removeAt(index);
    print('Task removed successfully!');
  }
}
