import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/model/notification/MessageList.dart';
import 'package:flutter_auth/model/notification/globalnotification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:firebase_core/firebase_core.dart';

class DisplayNotification extends StatelessWidget {

    String msgtitle ="title";
    String msgbody ="body";
  DisplayNotification(this.msgtitle,this.msgbody);
    List _message=List.empty();

  @override
  void initState(){
    requestPermission();
    _message =["Title","Body"];
    //MessageList();
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Container(
            padding: EdgeInsets.only(left: 55, top: 25, right: 16, bottom: 20),
            child: Text("Notification"),
          ),
       //   title: Text("Notification"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(6),
                child: Center(
                  //child: Text("NotificationList"),
                ),
              ),
              MessageList(),
            ],
          ),
        ),
      );
    }
}
