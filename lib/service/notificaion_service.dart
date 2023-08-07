import 'dart:html';
import 'dart:math';
import 'package:amaliy/ui/detail/detail_screen.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final NotificationService instance = NotificationService._();

  NotificationService._();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  init() {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    DarwinInitializationSettings darwinInitializationSettings =
        const DarwinInitializationSettings();

    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse){}
    );

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestPermission();

    tz.initializeTimeZones();
  }

  void showNotification() {
    flutterLocalNotificationsPlugin.show(
      Random().nextInt(100),
      'Flutter N8',
      'Flutter',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'id',
          'name',
          importance: Importance.high,
          priority: Priority.max,
          fullScreenIntent: true,
          actions: [
            AndroidNotificationAction(
              '1',
              'title',
            ),
          ],
        ),
      ),
    );
  }

  void showNotificationOnPeriod() async {
    await flutterLocalNotificationsPlugin.periodicallyShow(
      2,
      'Flutter N8',
      'Flutter',
      RepeatInterval.daily,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'id',
          'name',
          importance: Importance.low,
          priority: Priority.low,
        ),
      ),
    );
  }

  void showNotificationWithDateTime() {
    flutterLocalNotificationsPlugin.zonedSchedule(
      2,
      'Flutter N8',
      'Flutter',
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 3)),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'id',
          'name',
          importance: Importance.low,
          priority: Priority.low,
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
