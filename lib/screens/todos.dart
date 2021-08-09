import 'package:flutter/material.dart';
import 'package:personal/constants.dart';
import 'package:personal/services/prep_data.dart';
import 'package:personal/widgets/main_scaffold.dart';
import 'package:get/get.dart';
import 'add_note.dart';
import 'package:get_storage/get_storage.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  final todoBox = GetStorage("TodoStorage");

  List todoStructure = [
    {
      "title": "",
      "text": "",
      "date": "", //Datetime
      "finishdate": "",
    }
  ];

  Future<void> getData() async {
    todoStructure = await todoBox.getValues().toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      bgColor: kDarkBackground,
      actionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => NewNote());
          },
          child: Icon(Icons.add)),
      headLine: "Todo's",
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        children: PrepData().prepChilds(todoStructure),
      ),
    );
  }
}
