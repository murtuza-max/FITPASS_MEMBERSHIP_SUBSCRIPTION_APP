import 'package:flutter/material.dart';
import 'package:flutter_auth/Activities/activitydart/calisthenics.dart';

import 'package:flutter_auth/Activities/Screen/calisthenics_details_screen.dart';

//lib>screens>calisthenics_list_screen.dart

class CalisthenicsListScreen extends StatelessWidget {
  var clubname="Pro club";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.fromLTRB(40, 3, 16, 4),
            child: Text('FITNESS CLUBS'),
          ),
        ),
        body: ListView.builder(
            itemCount: gymList.length,
            itemBuilder: (context, index) {
              Calisthenics calisthenics = gymList[index];
              return Card(
                child: ListTile(
                  title: Text(calisthenics.title,),
                  subtitle: Text("Pro clubs"),
                  leading: Image.network(calisthenics.imageUrl),
                  trailing: Icon(Icons.arrow_forward_rounded),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CalisthenicsDetailsScreen(calisthenics,clubname)));
                  },
                ),
              );
            }));
  }
}