import 'package:flutter/material.dart';
import 'package:personal/widgets/main_scaffold.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

class Clock extends StatelessWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyScaffold(
        actionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        headLine: "Wecker",
        body: ListView(
          children: [
            ListTile(
              title: Text("5.20"),
            )
          ],
        ),
      ),
    );
  }
}
