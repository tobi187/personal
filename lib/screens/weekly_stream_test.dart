// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:personal/widgets/main_scaffold.dart';
// import 'package:personal/constants.dart';
//
// class WeeklyToDos extends StatefulWidget {
//   WeeklyToDos({Key? key}) : super(key: key);
//
//   @override
//   _WeeklyToDosState createState() => _WeeklyToDosState();
// }
//
// class _WeeklyToDosState extends State<WeeklyToDos> {
//   final weeklyBox = GetStorage("WeeklyStorage");
//   var weeklyStructure;
//
//   @override
//   void initState() {
//     super.initState();
//     weeklyStructure = weeklyBox.read("todos");
//   }
//
//   void test() {
//     weeklyStructure.listen();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: MyScaffold(
//           bgColor: kDarkBackground,
//           actionButton: FloatingActionButton(
//             child: Icon(Icons.add),
//             onPressed: () {
//               // ToDo: add weekly todo
//             },
//           ),
//           headLine: "Weekly Tasks",
//           body: StreamBuilder(
//             stream: w,
//           )),
//     );
//   }
// }
