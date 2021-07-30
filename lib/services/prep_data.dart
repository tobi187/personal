import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal/constants.dart';
import 'package:personal/screens/add_note.dart';

class PrepData {
  List data = ["hey", "du", "kuh"];
  // we need here the saved todos for everyday / alarms /

  List<Widget> prepChilds() {
    List<Widget> output = [];
    for (String child in data) {
      output.add(
        GestureDetector(
          onLongPress: () {
            Get.to(() => NewNote(text: child));
          },
          child: Card(
            color: kColor2,
            elevation: 7.0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ExpandableText(
                child,
                style: GoogleFonts.lato(
                  color: Colors.white,
                ),
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
}
