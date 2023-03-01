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
      "notificationapp",
      "notificationappchannel",
      playSound: true,
      importance: Importance.max,
      priority: Priority.high,
    );
    var not = NotificationDetails(android: androidPlateformChannelSpecifies);
    await fln.show(0, title, body, not);
  }
}
