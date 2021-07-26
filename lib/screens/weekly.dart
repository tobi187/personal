import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:personal/widgets/main_scaffold.dart';
import 'package:personal/constants.dart';

class WeeklyToDos extends StatefulWidget {
  WeeklyToDos({Key? key}) : super(key: key);

  @override
  _WeeklyToDosState createState() => _WeeklyToDosState();
}

class _WeeklyToDosState extends State<WeeklyToDos> {
  final List weeklyStructure = [
    {
      "id": 0,
      "title": "sport",
      "amount": 3,
    },
    {
      "id": 1,
      "title": "message",
      "amount": 6,
    },
    {
      "id": 2,
      "title": "hustle",
      "amount": 1,
    },
  ];

  @override
  void initState() {
    super.initState();
    var dataBox = Hive.openBox("weekly");
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: MyScaffold(
        bgColor: kDarkBackground,
        actionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            // ToDo: add weekly todo
          },
        ),
        headLine: "Weekly Tasks",
        body: ListView(
            children: weeklyStructure
                .map((todo) => GestureDetector(
                      onHorizontalDragEnd: (details) {
                        double detectionMin = 6.0;
                        if (details.primaryVelocity! > detectionMin) {
                          setState(() {
                            todo["amount"]++;
                          });
                        }
                      },
                      child: Card(
                        color: kBrightBlue,
                        elevation: 5.0,
                        child: ListTile(
                          leading: Text(
                            todo["amount"].toString(),
                            style: GoogleFonts.merriweatherSans(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          //enabled: e["amount"] > 0 ? true : false,
                          title: Text(
                            todo["title"],
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                decoration: todo["amount"] > 0
                                    ? TextDecoration.none
                                    : TextDecoration.lineThrough),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.done),
                            onPressed: () {
                              setState(() {
                                todo["amount"]--;
                              });
                            },
                          ),
                        ),
                      ),
                    ))
                .toList()),
      ),
    );
  }
}
