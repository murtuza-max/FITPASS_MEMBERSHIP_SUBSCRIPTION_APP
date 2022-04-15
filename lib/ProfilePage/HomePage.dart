import 'package:flutter/material.dart';
import 'package:flutter_auth/Membershipcard/passDetails.dart';
import 'package:flutter_auth/ProfilePage/Homeview.dart';
import 'package:flutter_auth/ProfilePage/MapScreen/FitMap.dart';
import 'package:flutter_auth/ProfilePage/MapScreen/directionHomepage.dart';
import 'package:flutter_auth/ProfilePage/MapScreen/mapextra.dart';

import 'package:flutter_auth/ProfilePage/QrCodeScanner/screens/createqr.dart';

import 'package:flutter_auth/model/notification/notify.dart';
import 'package:neon/neon.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import '../Activities/activitydart/ActivityScreen.dart';
import 'persondata/details.dart';
import 'my_drawer_header.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

String title = "FITPASS";
final GlobalKey<ScaffoldState> sf2=new GlobalKey<ScaffoldState>();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  DateTime pre_backpress = DateTime.now();

  final List<Widget> _children = [
    //EditProfilePage("Edit Profile"),
    HomeView(),
    //MapScr(),
    CurrentLocationScreen(),
    ActivitiesScreen(),
  ];

 late AndroidNotificationChannel channel;
 late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  String msgtitle = "Title";
  String msgbody = "Body";
  String token = " ";

  Future Logout() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.remove('email');

  }

  @override
  void initState() {
    super.initState();

    print(
        "Init State Started Homepage.dart#####################################3");
    requestPermission();
    loadFCM();
    listenFCM();
    getToken();
    FirebaseMessaging.instance.subscribeToTopic("Fitness");
    //  _message = ["Title", "Body"];
//
    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print(
            "##################33FirebaseMessaging.instance.getInitialMessage#############3");
        if (message != null) {
          print("New Notification");
          if (message.data['_id'] != null) {
            msgtitle = message.notification!.title!;
            msgbody = message.notification!.body!;

            /* Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayNotification(msgtitle, msgbody),
              ),
            );*/
            Navigator.pushNamed(
              context,
              '/notify',
              arguments: MessageArguments(message, true),
            );
          }
        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print(
            "###################33FirebaseMessaging.onMessageOpenedApp.listen################");
        if (message.notification != null) {
          print(message.notification!.title);
          msgtitle = message.notification!.title!;

          print(message.notification!.body);
          msgbody = message.notification!.body!;

          print("message.data22 ${message.data['_id']}");
          if (message.data['_id'] != null) {
            /*Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayNotification(msgtitle, msgbody),
              ),
            );*/
            Navigator.pushNamed(
              context,
              '/notify',
              arguments: MessageArguments(message, true),
            );
          }
        }
      },
    );
  }

  void sendPushMessage() async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAAxr8RfEU:APA91bGVS1fNb5o0_uZRi0g6pzty9WyTlLPxwNMkM3nC3YQteNg9eiLXT0ohN14aFrzZDzhTbpNqlAX8jtCFLiB_y33jG5poUznGSFH5BfZ0WpJruj6KSk1sFlj_qnekrajgfVoIYM_C',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': 'Test Body',
              'title': 'Test Title 2'
            },
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            "to": "$token",
          },
        ),
      );
    } catch (e) {
      print("error push notification");
    }
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        token = token;
      });
    });
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

  void listenFCM() async {
    // List<RemoteMessage> _message=[];
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      ////////////////
      msgtitle = message.notification!.title!;
      msgbody = message.notification!.body!;
      ////////////////////////
      print(
          "########### FirebaseMessaging.onMessage.listen ...homepage.dart######################3");
      print("message.notification.title : ");
      print(message.notification!.title!);
      print("message.notification.body : ");
      print(message.notification!.body!);

      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              color: Colors.blue,
              playSound: true,
              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: 'launch_background',
            ),
          ),
        );

        Navigator.pushNamed(
          context,
          'notifylist',
          arguments: MessageArguments(message, true),
        );
        // LocalNotificationService.createanddisplaynotification(message);
        // MessageListview(context);
        //MessageView();
        //LocalNotificationService.createanddisplaynotification(RemoteMessage message);

      }
    });
  }

  void loadFCM() async {
    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        importance: Importance.high,
        enableVibration: true,
      );

      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      /// Create an Android Notification Channel.
      ///
      /// We use this channel in the `AndroidManifest.xml` file to override the
      /// default FCM channel to enable heads up notifications.
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      /// Update the iOS foreground notification presentation options to allow
      /// heads up notifications.
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
//ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    return WillPopScope(
      onWillPop: () async{
      final value = await  showDialog<bool>(context: context, builder: (context){
          return AlertDialog(
            title: Text('alert'),
            content: Text('want to Exit'),
            actions: [
              ElevatedButton(onPressed: ()=>Navigator.of(context).pop(false), child: Text('No'),),
              ElevatedButton(onPressed: ()=>Navigator.of(context).pop(true), child: Text('Exit'),),
            ],
          );
        });
      if(value!=null){
        return Future.value(value);
      }else{
        return Future.value(false);
      }

        //movetolastScreen();
      },
      child: new Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 161, 134, 233),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(70, 12, 15, 12),
            child:
                Text(
              title,
              style: TextStyle(fontSize: 23, color: Colors.white),
            ),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateScreen(),
                    ),
                  );
                },
                icon: Icon(Icons.qr_code_scanner_rounded)),
          ],
        ),
        body: _children[_currentIndex],

        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.explore),
              label: "Explore",
            ),
            //BottomNavigationBarItem(
            //  icon: new Icon(Icons.account_circle),
            // label: "Activity",
            //),
            BottomNavigationBarItem(
              icon: new Icon(Icons.account_circle),
              label: "Activity",
            ),
          ],
        ),
        drawer: new Drawer(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  MyHeaderDrawer(),
                  new ListTile(
                    leading: new Icon(Icons.dashboard_outlined, size: 30),
                    title: new Text("Edit Profile"),
                    trailing: new Icon(Icons.arrow_right),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed("/editpage");
                    },
                  ),
                  new ListTile(
                    leading: new Icon(Icons.people_alt_outlined, size: 30),
                    title: new Text("Personal Details"),
                    trailing: new Icon(Icons.arrow_right),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed("/persondet");
                    },
                  ),
                  new ListTile(
                    leading: new Icon(Icons.credit_card, size: 30),
                    title: new Text("FIT CARD"),
                    trailing: new Icon(Icons.arrow_right),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed("/fitcard");
                    },
                  ),
                  new Divider(),
                  new ListTile(
                    leading: new Icon(Icons.notifications_outlined, size: 30),
                    title: new Text("Notification"),
                    trailing: new Icon(Icons.arrow_right),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed("/NotificationPage");
                    },
                  ),
                  new ListTile(
                    leading: new Icon(Icons.privacy_tip_outlined, size: 30),
                    title: new Text("Privacy Policy"),
                    trailing: new Icon(Icons.arrow_right),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed("/privacypage");
                    },
                  ),


                new Divider(),
                  new ListTile(
                    leading: new Icon(Icons.logout, size: 30),
                    title: new Text("Logout"),
                    trailing: new Icon(Icons.arrow_right),
                    onTap: () async => {
                      Logout(),
                      await FirebaseAuth.instance.signOut(),
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      ),
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (_currentIndex == 0) {
        title = "FITPASS";
      } else if (_currentIndex == 1) {
        title = "FITMAP";
      } else if (_currentIndex == 2) {
        title = "ACTIVITY";
      }
    });
  }

  void movetolastScreen(){

    Navigator.pop(context);
  }
}
/*
  Widget MessageListview(BuildContext context) {
    if(_message.isEmpty)
    {
      return const Text('No message ');
    }
    return ListView.builder(
        itemCount: _message.length,
        itemBuilder: (context,index){
          RemoteMessage message = _message[index];
          return ListTile(
            title: Text(message.notification.title ?? 'N/D',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(message.sentTime.toString() ?? DateTime.now().toString(),

            ),
            trailing: Icon(Icons.notifications_active,color: Colors.red),
            onTap: ()=> Navigator.pushNamed(context, '/NotificationPage',arguments: MessageArguments(message, false)),
          );
        }
    );
  }
}
*/

/*
class NotificationPage extends StatefulWidget {
  const NotificationPage({Key key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  AndroidNotificationChannel channel;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
   String msgtitle ="Title";
   String msgbody ="Body";
  String token = " ";

 // PushNotification _notificationinfo;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    requestPermission();
    loadFCM();
    listenFCM();
    getToken();
    FirebaseMessaging.instance.subscribeToTopic("Fitness");

    ////////////////////////////////////////////////////

    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
          (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          if (message.data['_id'] != null) {

            msgtitle=message.notification.title;
            msgbody=message.notification.body;

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayNotification(msgtitle,msgbody),
              ),
            );
          }
        }
      },
    );


    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
          (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification.title);
          msgtitle=message.notification.title;

          print(message.notification.body);
          msgbody=message.notification.body;

          print("message.data22 ${message.data['_id']}");
          if (message.data['_id'] != null) {

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayNotification(msgtitle,msgbody),
              ),
            );
          }
        }
      },
    );
  }


  void sendPushMessage() async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
          'key=AAAAxr8RfEU:APA91bGVS1fNb5o0_uZRi0g6pzty9WyTlLPxwNMkM3nC3YQteNg9eiLXT0ohN14aFrzZDzhTbpNqlAX8jtCFLiB_y33jG5poUznGSFH5BfZ0WpJruj6KSk1sFlj_qnekrajgfVoIYM_C',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': 'Test Body',
              'title': 'Test Title 2'
            },
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            "to": "$token",
          },
        ),
      );
    } catch (e) {
      print("error push notification");
    }
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        token = token;
      });
    });
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


  void listenFCM() async {

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      ////////////////
      msgtitle=message.notification.title;
      msgbody=message.notification.body;
      ////////////////////////
      print("message.notification.title : ");
      print(message.notification.title);
      print("message.notification.body : ");
      print(message.notification.body);
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              color: Colors.blue,
              playSound: true,
              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: 'launch_background',
            ),
          ),
        );
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DisplayNotification(msgtitle,msgbody),
          ),
        );
        LocalNotificationService.createanddisplaynotification(message);
      }
    });
  }

  void loadFCM() async {
    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        importance: Importance.high,
        enableVibration: true,
      );

      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      /// Create an Android Notification Channel.
      ///
      /// We use this channel in the `AndroidManifest.xml` file to override the
      /// default FCM channel to enable heads up notifications.
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      /// Update the iOS foreground notification presentation options to allow
      /// heads up notifications.
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }


  @override
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

              SizedBox(
                height: 35,
              ),

            ]
        ),
      ),
    );
  }
}
*/
