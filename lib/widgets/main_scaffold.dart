import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal/screens/wecker.dart';
import 'package:personal/screens/weekly.dart';

class MyScaffold extends StatelessWidget {
  final Widget body;
  final actionButton;
  final String headLine;
  const MyScaffold(
      {Key? key,
      required this.actionButton,
      required this.headLine,
      required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: actionButton,
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Text("Menu"),
              ),
              ListTile(
                title: Text("Wecker"),
                onTap: () {
                  Get.to(() => Clock());
                },
              ),
              ListTile(
                title: Text("Weekly Tasks"),
                onTap: () {
                  Get.to(() => WeeklyToDos());
                },
              ),
              ListTile(title: Text("News")),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(headLine),
        ),
        body: body,
      ),
    );
  }
}
