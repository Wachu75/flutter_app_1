// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter_application_3/data/models/task_priority.dart';

class Task {
  const Task({
    required this.id,
    required this.title,
    required this.taskPriority,
    this.subtitle,
    this.color,
  });

  final String id;
  final Color? color;
  final String title;
  final String? subtitle;
  final TaskPriority taskPriority;

  Task copyWith({
    String? id,
    Color? color,
    String? title,
    String? subtitle,
    TaskPriority? taskPriority,
  }) {
    return Task(
      id: id ?? this.id,
      color: color ?? this.color,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      taskPriority: taskPriority ?? this.taskPriority,
    );
  }
}
