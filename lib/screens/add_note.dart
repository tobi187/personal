import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:highlight/languages/python.dart';
import 'package:highlight/languages/plaintext.dart';
import 'package:highlight/languages/dart.dart';
import 'package:highlight/languages/javascript.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';

class NewNote extends StatefulWidget {
  String text;
  NewNote({Key? key, this.text = ""}) : super(key: key);

  @override
  _NewNoteState createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  CarouselController _carouselController = CarouselController();
  int currCodeLanguage = 0;
  List languages = [plaintext, dart, python, javascript];
  CodeController? _codeController;
  String? text;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _codeController = CodeController(
        text: widget.text,
        language: languages[currCodeLanguage],
        theme: monokaiSublimeTheme);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _codeController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _codeController = CodeController(
      text: text ?? widget.text,
      language: languages[currCodeLanguage],
      theme: monokaiSublimeTheme,
    );
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40),
          CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              height: 40,
              onPageChanged: (int number, reason) {
                setState(() {
                  currCodeLanguage = number;
                  widget.text = _codeController!.value.text;
                });
              },
            ),
            items: ["Text", "Python", "Dart", "JavaScript"]
                .map((e) => Text(e, style: TextStyle(fontSize: 20)))
                .toList(),
          ),
          //       .map((e) => Builder(
          //             builder: (BuildContext context) {
          //               return Container(
          //                 width: MediaQuery.of(context).size.width,
          //                 margin: EdgeInsets.symmetric(horizontal: 5.0),
          //                 decoration: BoxDecoration(color: Colors.amber),
          //                 child: Text(
          //                    e,
          //                   style: TextStyle(fontSize: 16.0),
          //                 ),
          //               );
          //             },
          //           ))
          //       .toList(),
          // ),
          SizedBox(
            height: 5,
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 2, color: Colors.black))),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              minLines: 1,
              maxLines: 5,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(fontSize: 20),
              decoration: InputDecoration(
                hintText: "Titel",
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
                decoration: new BoxDecoration(
                    border: new Border.all(
                        color: Colors.black12,
                        width: 5.0,
                        style: BorderStyle.solid)),
                child: CodeField(
                  controller: _codeController!,
                  textStyle: GoogleFonts.sourceCodePro(),
                )
                // child: TextField(
                //     maxLines: 50,
                //     style: GoogleFonts.lato(
                //       fontWeight: FontWeight.w200,
                //       fontSize: 25.0,
                //     )),
                ),
          )
        ],
      ),
    );
  }
}