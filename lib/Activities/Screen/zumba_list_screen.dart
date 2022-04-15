import 'package:flutter/material.dart';
import 'package:flutter_auth/Activities/activitydart/zumba.dart';

import 'package:flutter_auth/Activities/Screen/zumba_details_screen.dart';

//lib>screens>zumba_list_screen.dart

class ZumbaListScreen extends StatelessWidget {
  var clubname="Elite club";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            padding: EdgeInsets.only(left: 54, top: 25, right: 16, bottom: 20),
            child: new Text('FITNESS CLUBS'),
          ),
        ),
        body: ListView.builder(
            itemCount: gymList.length,
            itemBuilder: (context, index) {
              Zumba zumba = gymList[index];
              return Card(
                child: ListTile(
                  title: Text(zumba.title),
                  subtitle: Text("Elite club"),
                  leading: Image.network(zumba.imageUrl),
                  trailing: Icon(Icons.arrow_forward_rounded),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ZumbaDetailsScreen(zumba,clubname)));
                  },
                ),
              );
            }));
  }
}