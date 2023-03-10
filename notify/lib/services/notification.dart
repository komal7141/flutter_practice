import 'dart:ffi';
import 'dart:js';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../pages/data.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    "notificationapp_01", "notificationappch_01",
    groupId: "Notification_group");

class notificationservices {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize =
        new AndroidInitializationSettings("mipmap/ic_launcher");
    var initializetionSettings =
        new InitializationSettings(android: androidInitialize);
    await flutterLocalNotificationsPlugin.initialize(initializetionSettings,
        onDidReceiveNotificationResponse: (id) async {
      print("onSelectNotification");
      if (id != null) {
        print("Router Value1234 $id");
      }
    });
    
  }

  static void createanddisplay(RemoteMessage message) async {
    try {
      final id = DateTime.now().microsecondsSinceEpoch ~/ 10000000;
      AndroidNotificationDetails androidPlateformChannelSpecifies =
          AndroidNotificationDetails(
        "notificationapp_01",
        "notificationappch_01",
        importance: Importance.max,
        priority: Priority.high,
        groupKey: "Notification_group",
      );
      NotificationDetails not =
          NotificationDetails(android: androidPlateformChannelSpecifies);
      await flutterLocalNotificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        androidPlateformChannelSpecifies as NotificationDetails?,
        payload: message.data['_id'],
      );
    } on Exception catch (e) {
      print(e);
    }
  }

  static void showBigTextNotification(
      {var id = 0,
      required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidPlateformChannelSpecifies =
        AndroidNotificationDetails("notificationapp_01", "notificationappch_01",
            playSound: true,
            sound: RawResourceAndroidNotificationSound("notification1"),
            importance: Importance.max,
            priority: Priority.high,
            groupKey: "Notification_group");
    NotificationDetails not =
        NotificationDetails(android: androidPlateformChannelSpecifies);
    await fln.show(0, title, body, not);
  }

  static void createanddisplaynotification(
      {var id = 0,
      required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidPlateformChannelSpecifies =
        AndroidNotificationDetails("notificationa_01", "notificationappch_01",
            playSound: true,
            sound: RawResourceAndroidNotificationSound("notification2"),
            importance: Importance.max,
            priority: Priority.high,
            groupKey: "Notification_group");
    NotificationDetails not =
        NotificationDetails(android: androidPlateformChannelSpecifies);
    await fln.show(0, title, body, not);
  }

  void groupNotifications() async {
    final id = DateTime.now().microsecondsSinceEpoch ~/ 10000000;
    List<ActiveNotification>? activeNotifications =
        await flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.getActiveNotifications();
    if (activeNotifications!.length > 0) {
      List<String> lines =
          activeNotifications.map((e) => e.title.toString()).toList();
      InboxStyleInformation inboxStyleInformation = InboxStyleInformation(
        lines,
        contentTitle: "${activeNotifications.length} messages",
        summaryText: "${activeNotifications.length} messages",
      );
      AndroidNotificationDetails groupandroidPlateformChannelSpecifies =
          AndroidNotificationDetails(
        "notificationapp_01",
        "notificationappch_01",
        styleInformation: inboxStyleInformation,
        setAsGroupSummary: true,
        importance: Importance.max,
        priority: Priority.high,
        groupKey: "Notification_group",
      );

      NotificationDetails groupnot =
          NotificationDetails(android: groupandroidPlateformChannelSpecifies);
      await flutterLocalNotificationsPlugin.show(id, '', '', groupnot);
    }
  }
}
