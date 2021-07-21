// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
//
// class AlarmPlan {
//   Future<void> scheduleAlarm() async {
//     tz.initializeTimeZones();
//     tz.setLocalLocation(tz.getLocation("Germany/Berlin"));
//
//     final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//         FlutterLocalNotificationsPlugin();
//
//     var alarmTime = tz.TZDateTime.utc(2021, 7, 21, 7, 45);
//
//     flutterLocalNotificationsPlugin.zonedSchedule(
//         0,
//         "liö",
//         "fku",
//         alarmTime,
//         const NotificationDetails(
//             android: AndroidNotificationDetails("??", "??", "whatever", playSound: true, sound: )),
//         uiLocalNotificationDateInterpretation:
//             UILocalNotificationDateInterpretation.absoluteTime,
//         androidAllowWhileIdle: true);
//   }
// }
