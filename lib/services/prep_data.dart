import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class PrepData {
  // we need here the saved todos for everyday / alarms /

  List sampleData = ["lu", "dow", "kalsd", "sucki"];
  List sampleChild = ["my", "children", "samp"];

  List<Widget> prepChilds() {
    List<Widget> output = [];
    for (String child in sampleChild) {
      output.add(Text(child));
    }
    return output;
  }

  List<Widget> prepData() {
    List<Widget> output = [];

    for (String header in sampleData) {
      output.add(
        ExpansionTile(
          title: Text(header),
          children: [
            Column(children: prepChilds()),
          ],
        ),
      );
    }
    return output;
  }
}
