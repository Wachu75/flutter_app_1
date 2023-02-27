import 'package:flutter/material.dart';
import 'package:flutter_application_3/data/controllers/list_notifier.dart';
import 'package:flutter_application_3/data/list_of_tasks.dart';
import 'package:flutter_application_3/view/edit_task_page.dart';
import 'package:flutter_application_3/view/widgets/my_list_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Academy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: FirstWidget(),
    );
  }
}

// ignore: must_be_immutable
class FirstWidget extends StatelessWidget {
  FirstWidget({super.key});

  bool checkboxValue = false;

  final listNotifier = ListNotifier(listOfTask);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ValueListenableBuilder(
          valueListenable: listNotifier,
          builder: (context, value, child) {
            return ListView.builder(
              itemCount: listOfTask.length,
              itemBuilder: (context, index) => MyListTile(
                task: listOfTask[index],
                listNotifier: listNotifier,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EditTaskPage(listNotifier: listNotifier),
            ),
          );
        },
      ),
    );
  }
}
