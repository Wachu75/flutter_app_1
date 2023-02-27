import 'package:flutter/material.dart';
import 'package:flutter_application_3/data/models/task.dart';

class ListNotifier extends ValueNotifier<List<Task>> {
  ListNotifier(super.value);

  void addTask(Task task) {
    //value = [...value..add(task)];
    value.add(task);
    notifyListeners();
  }

  void updateTask(String id, Task task) {
    final index = value.indexWhere((element) => element.id == id);
    // value = [
    //   ...value
    //     ..removeAt(index)
    //     ..insert(index, task)
    // ];
    value.removeAt(index);
    value.insert(index, task);
    notifyListeners();
  }
}
