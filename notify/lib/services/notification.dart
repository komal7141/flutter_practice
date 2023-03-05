import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class notificationservices {
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize =
        new AndroidInitializationSettings("mipmap/ic_launcher");
    var initializetionSettings =
        new InitializationSettings(android: androidInitialize);
    await flutterLocalNotificationsPlugin.initialize(initializetionSettings);
  }

  static Future showBigTextNotification(
      {var id = 0,
      required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidPlateformChannelSpecifies =
        AndroidNotificationDetails(
      "notificationapp_01",
      "notificationappch_01",
      playSound: true,
      sound: RawResourceAndroidNotificationSound("notification1"),
      importance: Importance.max,
      priority: Priority.high,
    );
    var not = NotificationDetails(android: androidPlateformChannelSpecifies);
    await fln.show(0, title, body, not);
  }

  static Future createanddisplaynotification(
      {var id = 0,
      required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidPlateformChannelSpecifies =
        AndroidNotificationDetails(
      "notificationapp1",
      "notificationappchannel",
      playSound: true,
      sound: RawResourceAndroidNotificationSound("notification2"),
      importance: Importance.max,
      priority: Priority.high,
    );
    var not = NotificationDetails(android: androidPlateformChannelSpecifies);
    await fln.show(0, title, body, not);
  }
}
