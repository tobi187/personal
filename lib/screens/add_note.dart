import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal/screens/todos.dart';

class NewNote extends StatefulWidget {
  final String id;
  const NewNote({Key? key, this.id = ""}) : super(key: key);

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  String text = "";
  String title = "";
  String id = "";
  TextEditingController textController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.id != "") {
      Map todo = GetStorage("TodoStorage").read(widget.id);
      id = todo["id"];
      title = todo["title"];
      text = todo["text"];
    }
    textController.text = text;
    titleController.text = title;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Get.off(() => ToDoScreen());
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 35,
                ),
              ),
              IconButton(
                  onPressed: () {
                    // change this
                    GetStorage("TodoStorage").remove(title);
                  },
                  icon: Icon(Icons.delete)),
              IconButton(
                onPressed: () {
                  int currentId = GetStorage("TodoStorage").read("id");
                  String currentDate =
                      "${DateTime.now().day.toString()}.${DateTime.now().month.toString()}.${DateTime.now().year.toString()}";
                  GetStorage("TodoStorage").write(title, {
                    "id": currentId,
                    "title": title,
                    "text": text,
                    "date": currentDate,
                    "finishdate": ""
                  });
                },
                icon: Icon(
                  Icons.check,
                  size: 40,
                ),
              )
            ],
          ),
          TextField(
            minLines: 1,
            maxLines: 3,
            maxLength: 110,
            controller: titleController,
            decoration: InputDecoration(
              hintText: "Titel hinzufügen",
            ),
            style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            // onChanged: (value) {
            //   title = titleController.text;
            // },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                maxLines: null,
                autofocus: true,
                controller: textController,
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: "ToDo hinzufügen",
                ),
                onChanged: (value) {
                  text = textController.text;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class NewNote extends StatefulWidget {
//   String text;
//   NewNote({Key? key, this.text = ""}) : super(key: key);
//
//   @override
//   _NewNoteState createState() => _NewNoteState();
// }
//
// class _NewNoteState extends State<NewNote> {
//   CarouselController _carouselController = CarouselController();
//   int currCodeLanguage = 0;
//   List languages = [plaintext, python, dart, javascript];
//   CodeController? _codeController;
//   @override
//   void initState() {
//     super.initState();
//     _codeController = CodeController(
//         text: widget.text,
//         language: languages[currCodeLanguage],
//         theme: monokaiSublimeTheme);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _codeController?.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _codeController = CodeController(
//       text: widget.text,
//       language: languages[currCodeLanguage],
//       theme: monokaiSublimeTheme,
//     );
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(height: 40),
//           CarouselSlider(
//             carouselController: _carouselController,
//             options: CarouselOptions(
//               height: 40,
//               onPageChanged: (int number, reason) {
//                 setState(() {
//                   currCodeLanguage = number;
//                   widget.text = _codeController!.value.text;
//                 });
//               },
//             ),
//             items: ["Text", "Python", "Dart", "JavaScript"]
//                 .map((e) => Text(e, style: TextStyle(fontSize: 20)))
//                 .toList(),
//           ),
//           //       .map((e) => Builder(
//           //             builder: (BuildContext context) {
//           //               return Container(
//           //                 width: MediaQuery.of(context).size.width,
//           //                 margin: EdgeInsets.symmetric(horizontal: 5.0),
//           //                 decoration: BoxDecoration(color: Colors.amber),
//           //                 child: Text(
//           //                    e,
//           //                   style: TextStyle(fontSize: 16.0),
//           //                 ),
//           //               );
//           //             },
//           //           ))
//           //       .toList(),
//           // ),
//           SizedBox(
//             height: 5,
//             child: Container(
//               height: 1,
//               decoration: BoxDecoration(
//                   border: Border(
//                       bottom: BorderSide(width: 2, color: Colors.black))),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(10.0),
//             child: TextField(
//               minLines: 1,
//               maxLines: 5,
//               textAlign: TextAlign.center,
//               style: GoogleFonts.lato(fontSize: 20),
//               decoration: InputDecoration(
//                 hintText: "Titel",
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           Expanded(
//             child: Container(
//                 decoration: new BoxDecoration(
//                     border: new Border.all(
//                         color: Colors.black12,
//                         width: 5.0,
//                         style: BorderStyle.solid)),
//                 child: CodeField(
//                   controller: _codeController!,
//                   textStyle: GoogleFonts.sourceCodePro(),
//                 )
//                 // child: TextField(
//                 //     maxLines: 50,
//                 //     style: GoogleFonts.lato(
//                 //       fontWeight: FontWeight.w200,
//                 //       fontSize: 25.0,
//                 //     )),
//                 ),
//           ),
//           ElevatedButton(
//             onPressed: () {},
//             child: Text("Add Note"),
//           ),
//         ],
//       ),
//     );
//   }
// }
