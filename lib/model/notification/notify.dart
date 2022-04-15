import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class MessageArguments {
  final RemoteMessage message;
  final bool openApp;
  MessageArguments(this.message, this.openApp);
}

class MessageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MessageArguments args =
        ModalRoute.of(context)!.settings.arguments as MessageArguments;
    RemoteMessage message = args.message;
    RemoteNotification? notification = message.notification;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(left: 55, top: 25, right: 16, bottom: 20),
          child: Text("Message Data"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              if (notification != null) ...[

                Card(


                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //const Text('Notification inf:'),
                        Padding(
                          padding: EdgeInsets.fromLTRB(9, 7, 0, 0),
                          child: Row(children: [
                            Icon(Icons.message),
                            SizedBox(
                              width: 20,
                            ),
                            viewData('Title', notification.title!),
                          ]),
                        ),
                        SizedBox(
                          width: 40,
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(50, 3, 3, 3),
                          child: viewData('Data', notification.body!),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ]),

                ),

              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget viewData(String title, String body) {
    //if('$title'=='Title') {
    return
        //Text('$title:',style: TextStyle(fontWeight: FontWeight.bold),),
        Center(
      child: Expanded(
        child: Text(body ?? 'N/A',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      ),
    );
    //}
    /*else if('$title:'=='Data'){
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            //Text('$title:',style: TextStyle(fontWeight: FontWeight.bold),),
            Center(
              child: Expanded(
                child: Text(body ?? 'N/A',
                    style: TextStyle(fontWeight: FontWeight.normal)),
              ),
            ),
          ],
        ),
      );
    }*/
  }

  Widget img(String value) {
    return Container(
      child: Center(
        child: Image.network(
          value ??
              'https://images.unsplash.com/photo-1485875437342-9b39470b3d95?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=873&q=80',
          //height: 200,width: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget appbar(String value) {
    return Text(
      value ?? 'N/A',
      style: TextStyle(fontSize: 16),
    );
  }
}
