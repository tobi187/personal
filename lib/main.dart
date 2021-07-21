import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'screens/todos.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //     FlutterLocalNotificationsPlugin();
  // const AndroidInitializationSettings androidInitializationSettings =
  //     AndroidInitializationSettings("app_icon");
  // final InitializationSettings initializationSettings =
  //     InitializationSettings(android: androidInitializationSettings);
  // await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoScreen(),
    );
  }
}
