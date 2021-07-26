import 'package:flutter/material.dart';
import 'screens/todos.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';

void main() async {
  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //     FlutterLocalNotificationsPlugin();
  // const AndroidInitializationSettings androidInitializationSettings =
  //     AndroidInitializationSettings("app_icon");
  // final InitializationSettings initializationSettings =
  //     InitializationSettings(android: androidInitializationSettings);
  // await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  // await Hive.init(path);
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark().copyWith(
        backgroundColor: Colors.grey,
        brightness: Brightness.dark,
      ),
      theme: ThemeData.light().copyWith(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      home: ToDoScreen(),
    );
  }
}
