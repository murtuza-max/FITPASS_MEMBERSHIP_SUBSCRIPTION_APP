import 'package:flutter/material.dart';
import 'package:flutter_auth/Activities/activitydart/yog.dart';
import 'package:flutter_auth/Activities/Screen/yoga_details_screen.dart';

//lib>screens>yoga_list_screen.dart

class YogaListScreen extends StatelessWidget {
  var clubname="Elite club";
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
              Yoga yog = gymList[index];
              return Card(
                child: ListTile(
                  title: Text(yog.title),
                  subtitle: Text("Elite club"),
                  leading: Image.network(yog.imageUrl),
                  trailing: Icon(Icons.arrow_forward_rounded),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => YogaDetailsScreen(yog,clubname)));
                  },
                ),
              );
            }));
  }
}