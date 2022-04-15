import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:overlay_support/overlay_support.dart';
import 'dart:async';
import '../push_notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_auth/model/push_notification.dart';
import 'package:flutter_auth/main.dart';
import 'notification_badge.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late FirebaseMessaging _msg;
  late int _counter;

  late FlutterLocalNotificationsPlugin localNotification;
  late PushNotification _notificationinfo;

  void registerNotification() async {

    NotificationSettings settings = await _msg.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      provisional: false,
      sound: true,
      criticalAlert: false,
      carPlay: false,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("user granted permission : ${settings.authorizationStatus}");

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print("Got Message Successfull");
        if (message.notification != null) {
          final snackBar = SnackBar(
              content: Text(
            message.notification!.title ?? '',
            maxLines: 2,
          ));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        PushNotification notification = PushNotification(
          title: message.notification!.title!,
          body: message.notification!.body!,
          dataTitle: message.data['title'],
          dataBody: message.data['body'],
        );
        setState(() {
          _counter++;
          _notificationinfo = notification;
        });

        if (notification != null) {
          showSimpleNotification(
            Text(_notificationinfo.title),
            leading: NotificationBadge(
              counter: _counter,
            ),
            subtitle: Text(_notificationinfo.body),
            background: Colors.cyanAccent,
            duration: Duration(seconds: 3),
          );
        }
      });
    } else {
      print("permission declines by user!!");
    }
  }

  @override
  void initState() {
    super.initState();
    _msg = FirebaseMessaging.instance;
    _counter = 0;
    var androidInitialize = new AndroidInitializationSettings('ic_launcher');
    localNotification = new FlutterLocalNotificationsPlugin();
    var initializationSettings = new InitializationSettings(android: androidInitialize);
    localNotification.initialize(initializationSettings);

    registerNotification();

  }

  Future _showNotification() async {
    var androidDetails = new AndroidNotificationDetails(
        "channel1Id", "Local Notification",
        importance: Importance.high);
    var generalNotificationDet =
        new NotificationDetails(android: androidDetails);
    await localNotification.show(
        0, "title", "Hello body", generalNotificationDet);
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(60, 12, 15, 12),
          child: Text("Notifications"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Flutter Notification",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 18,
            ),
            NotificationBadge(counter: _counter),
            _notificationinfo != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          "Title : ${_notificationinfo.dataTitle ?? _notificationinfo.title}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 9),
                      Text(
                          "Title : ${_notificationinfo.dataBody ?? _notificationinfo.body}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
