import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal/widgets/bottom_sheet.dart';
import 'package:personal/widgets/main_scaffold.dart';
import 'package:personal/constants.dart';

class WeeklyToDos extends StatefulWidget {
  WeeklyToDos({Key? key}) : super(key: key);

  @override
  _WeeklyToDosState createState() => _WeeklyToDosState();
}

class _WeeklyToDosState extends State<WeeklyToDos> {
  final weeklyBox = GetStorage("WeeklyStorage");
  List weeklyStructure = [
    {
      "id": 0,
      "title": "Here could be your Todo",
      "amount": 0,
    }
  ];

  @override
  void initState() {
    super.initState();
    weeklyStructure = weeklyBox.getValues().toList();
    print(weeklyStructure);
  }

  // void test() {
  //   weeklyBox.write("1", {"name": "Down", "key": "no", "id": 0});
  //   weeklyBox.write("2", {"name": "deri", "key": "y", "id": 1});
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: MyScaffold(
        bgColor: kDarkBackground,
        actionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            // ToDo: add weekly todo
            weeklyBox.write("down", {"title": "down", "amount": 2});
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => MyBottomSheet());
            setState(() {
              weeklyStructure = weeklyBox.getValues().toList();
            });
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
                            weeklyBox.write(todo["title"], {
                              "title": todo["title"],
                              "amount": todo["amount"]
                            });
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
                                weeklyBox.write(todo["title"], {
                                  "title": todo["title"],
                                  "amount": todo["amount"]
                                });
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
