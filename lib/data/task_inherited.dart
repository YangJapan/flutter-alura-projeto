import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required super.child});

  final List<Task> taskList = [
    Task("legal", 'assets/images/cachorro.jpg', 1),
    Task("legal", 'assets/images/cachorro.jpg', 2),
    Task("legal", 'assets/images/cachorro.jpg', 3),
    Task("legal", 'assets/images/cachorro.jpg', 4),
    Task("legal", 'assets/images/cachorro.jpg', 5),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context
        .dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
