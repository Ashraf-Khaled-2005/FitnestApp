import 'dart:async';
import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

class NotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static StreamController<NotificationResponse> streamController =
      StreamController();

  static OnTap(NotificationResponse detail) {
    streamController.add(detail);
  }

  static Future<void> init() async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );

    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveBackgroundNotificationResponse: OnTap,
      onDidReceiveNotificationResponse: OnTap,
    );
  }

  static void ShowBasicNotification() async {
    AndroidNotificationDetails andriod = AndroidNotificationDetails(
      sound: RawResourceAndroidNotificationSound('sound.mp4'.split('.').first),
      'id 1',
      "basic",
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    NotificationDetails details = NotificationDetails(android: andriod);
    await flutterLocalNotificationsPlugin.show(0, "basic", "body", details);
  }

  static void ShowReapetNotification() async {
    AndroidNotificationDetails andriod = const AndroidNotificationDetails(
      'id 2',
      "repeat",
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    NotificationDetails details = NotificationDetails(android: andriod);
    await flutterLocalNotificationsPlugin.periodicallyShow(
        1, "repeat", "body", RepeatInterval.everyMinute, details);
  }

  static void ShowScheduledNotification() async {
    AndroidNotificationDetails andriod = const AndroidNotificationDetails(
      'id 3',
      "scheduled",
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    NotificationDetails details = NotificationDetails(android: andriod);
    String CurrentZOne = await FlutterTimezone.getLocalTimezone();
    tz.initializeTimeZones();
    log(tz.local.name);
    log(tz.TZDateTime.now(tz.local).hour.toString());
    tz.setLocalLocation(tz.getLocation(CurrentZOne));
    log("***************************************************************");
    log(tz.local.name);
    log(tz.TZDateTime.now(tz.local).hour.toString());
    await flutterLocalNotificationsPlugin.zonedSchedule(
        2,
        'scheduled',
        "body",
        // tz.TZDateTime(tz.local, 2024, 8, 17, 17, 50),
        tz.TZDateTime.now(tz.local).add(Duration(seconds: 5)),
        details,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  static void CancelNotification(int id) {
    flutterLocalNotificationsPlugin.cancel(id);
  }
}
