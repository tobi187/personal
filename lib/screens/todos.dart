import 'package:flutter/material.dart';
import 'package:personal/services/prep_data.dart';
import 'package:personal/widgets/main_scaffold.dart';
import 'package:get/get.dart';
import 'add_note.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      bgColor: Colors.teal,
      actionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => NewNote());
          },
          child: Icon(Icons.add)),
      headLine: "Todo's",
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        children: PrepData().prepChilds(),
      ),
    );
  }
}
