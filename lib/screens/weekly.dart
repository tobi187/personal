import 'package:flutter/material.dart';
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
        headLine: "Wecker",
        body: ListView(
            children: weeklyStructure
                .map((e) => GestureDetector(
                      onHorizontalDragEnd: (details) {
                        double detectionMin = 8;
                        if (details.primaryVelocity! > detectionMin) {
                          setState(() {
                            e["amount"]++;
                          });
                        }
                      },
                      child: ListTile(
                        leading: Text(
                          e["amount"].toString(),
                        ),
                        //enabled: e["amount"] > 0 ? true : false,
                        title: Text(
                          e["title"],
                          style: TextStyle(
                              decoration: e["amount"] > 0
                                  ? TextDecoration.none
                                  : TextDecoration.lineThrough),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.done),
                          onPressed: () {
                            setState(() {
                              e["amount"]--;
                            });
                          },
                        ),
                      ),
                    ))
                .toList()),
      ),
    );
  }
}
