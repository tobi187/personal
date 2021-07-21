import 'package:flutter/material.dart';
import 'package:personal/widgets/main_scaffold.dart';

class Clock extends StatelessWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyScaffold(
        actionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        headLine: "Wecker",
        body: Column(
          children: [
            AnimatedContainer(
              child: Text("7:30"),
              duration: Duration(seconds: 1),
            ),
            Text("Sound:"),
          ],
        ),
      ),
    );
  }
}
