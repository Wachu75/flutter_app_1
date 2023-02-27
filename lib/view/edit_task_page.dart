import 'package:flutter/material.dart';
import 'package:flutter_application_3/data/controllers/list_notifier.dart';
import 'package:flutter_application_3/data/models/task.dart';
import 'package:flutter_application_3/data/models/task_priority.dart';
import 'package:flutter_application_3/view/widgets/color_picker.dart';
import 'package:flutter_application_3/view/widgets/dropdown_priority_picker.dart';
import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class EditTaskPage extends StatelessWidget {
  EditTaskPage({super.key, required this.listNotifier, this.task});

  final Task? task;

  final TextEditingController titleControler = TextEditingController();
  final TextEditingController descrControler = TextEditingController();
  final ListNotifier listNotifier;
  final ValueNotifier<Color> colorNotifier = ValueNotifier(Colors.white);
  final ValueNotifier<TaskPriority> priorityNotifier =
      ValueNotifier(TaskPriority.high);

  String? errorText;

  TextEditingController setTitleController(Task? task) {
    if (task == null) return titleControler;
    titleControler.text = task.title;
    return titleControler;
  }

  TextEditingController setSubtitleController(Task? task) {
    if (task == null) return descrControler;
    descrControler.text = task.subtitle ?? '';
    return descrControler;
  }

  ValueNotifier<TaskPriority> setPriorityNotifier(Task? task) {
    if (task == null) return priorityNotifier;
    priorityNotifier.value = task.taskPriority;
    return priorityNotifier;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const Text('Task name'),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: setTitleController(task),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Task description'),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: setSubtitleController(task),
                keyboardType: TextInputType.multiline,
                minLines: 3,
                maxLines: 14,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ColorPicker(
                colorNotifier: colorNotifier,
                task: task,
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownPriorityPicker(
                priorityNotifier: setPriorityNotifier(task),
                initialDropdownValue: task?.taskPriority,
              ),
              const SizedBox(
                height: 20,
              ),
              if (task == null)
                MaterialButton(
                  onPressed: () {
                    if (titleControler.text.isEmpty) {
                      errorText = 'Please enter title';
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'At least the title of the task must be indicated!',
                          ),
                        ),
                      );
                      return;
                    }
                    listNotifier.addTask(
                      Task(
                        id: Uuid().v4(),
                        color: colorNotifier.value,
                        title: titleControler.text,
                        subtitle: descrControler.text,
                        taskPriority: priorityNotifier.value,
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                  color: Colors.red,
                  child: const Text(
                    'Add Task',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              if (task != null)
                MaterialButton(
                  onPressed: () {
                    listNotifier.updateTask(
                      task!.id,
                      task!.copyWith(
                        color: colorNotifier.value,
                        title: titleControler.text,
                        subtitle: descrControler.text,
                        taskPriority: priorityNotifier.value,
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                  color: Colors.red,
                  child: const Text(
                    'Update Task',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
