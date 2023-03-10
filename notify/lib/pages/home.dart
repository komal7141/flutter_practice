import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:notify/services/notification.dart';

import '../main.dart';
import 'data.dart';

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
    //when your app is closed and you get notification when you click on it,the app open from close state.
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      print("FirebaseMessaging.instance.getInitialMessage");
      if (message != null) {
        print("new notification");
        if (message.data['_id'] != null) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => data(
                    id: message.data['_id'],
                  )));
        }
      }
    });
    //when your app is opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.details ${message.data}");
          notificationservices.createanddisplay(message);
        }
      },
    );
    //when your app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("FirebaseMessaging.onMessage.listen");
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);
        print("message.data22 ${message.data['_id']}");
      }
    });
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
