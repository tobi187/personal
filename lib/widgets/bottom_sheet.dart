import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:personal/screens/weekly.dart';

class MyBottomSheet extends StatefulWidget {
  MyBottomSheet({Key? key}) : super(key: key);

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  TextEditingController _numberController = TextEditingController();
  TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _numberController.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final weeklyBox = GetStorage("WeeklyStorage");
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        decoration: BoxDecoration(
          // shape: BoxShape.rectangle,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Add new Weekly Task"),
            TextField(
              controller: _textController,
            ),
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],

            ),
            ElevatedButton(
                onPressed: () {
                  if (_textController != "" && _numberController.text != "") {
                    print(_textController.text);
                    print(_numberController.text);
                    weeklyBox.write(_textController.text, {
                      "title": _textController.text,
                      "amount": int.parse(_numberController.text)
                    });
                    Navigator.pop(context);
                  }
                },
                child: Text("Add")),
            ElevatedButton(
                onPressed: () {
                  weeklyBox.erase();
                  Get.back();
                },
                child: Text("Delete Box"))
          ],
        ),
      ),
    );
  }
}
