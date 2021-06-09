import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void addTask(String newTaskName) {
    _tasks.add(Task(name: newTaskName));
    notifyListeners();
  }

  int get taskCount => _tasks.length;

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
