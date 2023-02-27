import 'package:flutter/material.dart';
import 'package:flutter_application_3/data/controllers/list_notifier.dart';
import 'package:flutter_application_3/data/models/task.dart';
import 'package:flutter_application_3/view/edit_task_page.dart';

class MyListTile extends StatefulWidget {
  const MyListTile({
    super.key,
    required this.task,
    required this.listNotifier,
  });
  final Task task;
  final ListNotifier listNotifier;

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColoredBox(
          color: widget.task.color ?? Colors.white,
          child: ListTile(
            leading: Checkbox(
              onChanged: (value) => setState(() {
                checkboxValue = value ?? false;
              }),
              value: checkboxValue,
            ),
            title: Text(widget.task.title),
            subtitle: Text(widget.task.subtitle ?? ''),
            trailing: widget.task.taskPriority.icon,
            style: ListTileStyle.list,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EditTaskPage(
                  listNotifier: widget.listNotifier,
                  task: widget.task,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
