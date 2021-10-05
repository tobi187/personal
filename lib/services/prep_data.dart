import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal/constants.dart';
import 'package:personal/screens/add_note.dart';

class PrepData {
  // we need here the saved todos for everyday / alarms /

  List<Widget> prepChilds(List data) {
    List<Widget> output = [];
    for (Map child in data) {
      output.add(
        GestureDetector(
          onLongPress: () {
            Get.to(() => NewNote(id: child["id"]));
          },
          child: Card(
            color: kColor2,
            elevation: 7.0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ExpandableText(
                child["title"] == ""
                    ? child["title"] + "\n${child["text"]}"
                    : child["text"],
                style: child["title"] == ""
                    ? GoogleFonts.lato(
                        color: Colors.white,
                      )
                    : GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                expandText: "",
                expandOnTextTap: true,
                collapseOnTextTap: true,
                maxLines: 3,
              ),
            ),
          ),
        ),
      );
    }
    return output;
  }
}
