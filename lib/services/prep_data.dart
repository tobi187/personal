import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal/screens/add_note.dart';

class PrepData {
  // we need here the saved todos for everyday / alarms /

  List sampleData = ["lu", "dow", "kalsd", "sucki"];
  List sampleChild = ["my", "children", "samp"];

  List<Widget> prepChilds() {
    List<Widget> output = [];
    for (String child in sampleChild) {
      output.add(
        GestureDetector(
          onLongPress: () {
            Get.to(() => NewNote(text: child));
          },
          child: Card(
            elevation: 7.0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ExpandableText(
                child,
                expandText: "",
                expandOnTextTap: true,
                collapseOnTextTap: true,
                maxLines: 5,
              ),
            ),
          ),
        ),
      );
    }
    return output;
  }

  List<Widget> prepData() {
    List<Widget> output = [];

    for (String header in sampleData) {
      output.add(
        ExpansionTile(
          collapsedBackgroundColor: Colors.white,
          title: Text(header),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: prepChilds(),
            ),
          ],
        ),
      );
    }
    return output;
  }
}
