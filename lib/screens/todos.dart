import 'package:flutter/material.dart';
import 'package:personal/services/prep_data.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text("Menu"),
            ),
            ListTile(title: Text("Wecker")),
            ListTile(title: Text("daily Tasks")),
            ListTile(title: Text("News")),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("ToDo's"),
      ),
      body: Column(
        children: PrepData().prepData(),
      ),
    );
  }
}
