import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Membershipcard/passDetails.dart';

import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/model/notification/MessageList.dart';
import 'package:flutter_auth/model/notification/displayNotification.dart';

import 'package:flutter_auth/model/notification/notify.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'persondata/details.dart';

import 'EditProfileData/EditProfile.dart';
import 'HomePage.dart';

import 'PrivacyPolicyData/privacypage.dart';

var finalEmail;

class StartApp extends StatefulWidget {
  @override
  _StartAppState createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
//class StartApp extends StatelessWidget {
  late RemoteMessage message;

  @override
  void initState(){
    getValidationData().whenComplete(() async{
      Timer(Duration(seconds: 2),() => Get.to(finalEmail == null ? LoginScreen() : HomePage()));
    });
  }

  Future<void> getValidationData() async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainemail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainemail;
    });
    print('EMail Address : ');
    print(finalEmail);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: HomePage(),
        routes: <String, WidgetBuilder>{
          "/editpage": (BuildContext context) =>
              new EditProfilePage("Edit Profile"),
          "/persondet": (BuildContext context) =>
              new DetailsPage("Personal Details"),
          "/fitcard": (BuildContext context) => new MemberpassPage("FIT CARD"),
          "/privacypage": (BuildContext context) =>
              new PrivacyPage("Privacy Policy"),
          "/NotificationPage": (BuildContext context) =>
              new DisplayNotification("title", "body"),
          "/notify": (BuildContext context) => new MessageView(),
          "/notifylist": (BuildContext context) => new MessageList(),
        });
  }

}
