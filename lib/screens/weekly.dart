import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal/widgets/main_scaffold.dart';

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
  Widget build(BuildContext context) {
    return Material(
      child: MyScaffold(
        actionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
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
                        elevation: 5.0,
                        child: ListTile(
                          leading: Text(
                            todo["amount"].toString(),
                            style: GoogleFonts.balooPaaji(
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
