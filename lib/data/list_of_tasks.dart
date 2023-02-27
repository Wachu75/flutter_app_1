import 'package:flutter/material.dart';
import 'package:flutter_application_3/data/models/task.dart';
import 'package:flutter_application_3/data/models/task_priority.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

List<Task> listOfTask = [
  Task(
    id: uuid.v4(),
    title: 'first Task',
    color: Colors.yellow,
    taskPriority: TaskPriority.low,
  ),
];
