import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notify/services/notification.dart';
import '../main.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
    super.initState();
    notificationservices.initialize(flutterLocalNotificationsPlugin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NotificationApp"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  notificationservices.showBigTextNotification(
                      title: "new message title",
                      body: "your notification",
                      fln: flutterLocalNotificationsPlugin);
                },
                child: Text('show 1st Notification')),
            ElevatedButton(
                onPressed: () {
                  notificationservices.createanddisplaynotification(
                      title: "new message title",
                      body: "your notification",
                      fln: flutterLocalNotificationsPlugin);
                },
                child: Text('show 2nd Notification')),
          ],
        ),
      ),
    );
  }
}
