import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal/screens/todos.dart';
import 'package:personal/screens/wecker.dart';
import 'package:personal/screens/weekly.dart';

class MyScaffold extends StatelessWidget {
  final Widget body;
  final actionButton;
  final String headLine;
  final bgColor;
  const MyScaffold(
      {Key? key,
      required this.actionButton,
      required this.headLine,
      required this.body,
      this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: bgColor,
        floatingActionButton: actionButton,
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 30),
              // Drawer Header
              ListTile(
                title: Text(
                  "      Menu",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                enabled: false,
              ),
              Container(
                  height: 1,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black, width: 1)))),
              ListTile(
                title: Text("Tasks"),
                onTap: () {
                  Get.to(() => ToDoScreen());
                },
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
          title: ListTile(
            title: Text(headLine),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Get.isDarkMode
                    ? Get.changeTheme(ThemeData.light())
                    : Get.changeTheme(ThemeData.dark());
              },
            ),
          ),
        ),
        body: body,
      ),
    );
  }
}
