import 'package:flutter/material.dart';
import 'package:flutter_auth/Activities/activitydart/dance.dart';
import 'package:flutter_auth/Activities/Screen/dance_details_screen.dart';

//lib>screens>dance_list_screen.dart

class DanceListScreen extends StatelessWidget {
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
              Dance dance = gymList[index];
              return Card(
                child: ListTile(
                  title: Text(dance.title),
                  subtitle: Text(dance.category.toString()),
                  leading: Image.network(dance.imageUrl),
                  trailing: Icon(Icons.arrow_forward_rounded),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DanceDetailsScreen(dance)));
                  },
                ),
              );
            }));
  }
}
