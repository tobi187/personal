import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class MyBottomSheet extends StatelessWidget {
  MyBottomSheet({Key? key}) : super(key: key);

  String title = "";
  String amount = "";
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
              onChanged: (value) {
                title = value;
              },
            ),
            TextField(
              onChanged: (value) {
                amount = value;
              },
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            ElevatedButton(
                onPressed: () {
                  print(amount);
                  print(amount.runtimeType);
                  print(title);
                },
                child: Text("Add")),
            ElevatedButton(
                onPressed: () {
                  // weeklyBox.erase();
                  Get.back();
                },
                child: Text("Delete Box"))
          ],
        ),
      ),
    );
  }
}
