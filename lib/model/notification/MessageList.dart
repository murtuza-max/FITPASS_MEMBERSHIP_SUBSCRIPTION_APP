import 'package:flutter/cupertino.dart';
import 'package:flutter_auth/model/notification/displayNotification.dart';
import 'package:flutter_auth/model/notification/getnotification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/model/notification/notify.dart';

class MessageList extends StatefulWidget {
  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {

  List<RemoteMessage> _message=[];

  @override
  void initState(){
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message)
    {
      setState(() {
      _message = [..._message,message];
    });
    });
  }

  @override
  Widget build(BuildContext context) {
   if(_message.isEmpty)
     {
       return const Text('No Notifications ',style: TextStyle(fontSize: 20,),);
     }
   return ListView.builder(
       shrinkWrap: true,
       itemCount: _message.length,
       itemBuilder: (context,index){
         RemoteMessage message = _message[index];
         return ListTile(
            title: Text(message.notification!.title ?? 'N/D',
            style: TextStyle(fontWeight: FontWeight.bold),
           ),
           subtitle: Text(message.sentTime.toString() ?? DateTime.now().toString(),

           ),
           trailing: Icon(Icons.notifications_active,color: Colors.red),
           onTap: ()=> Navigator.pushNamed(context, '/notify',arguments: MessageArguments(message, false)),
         );
        }
       );

  }
  }
