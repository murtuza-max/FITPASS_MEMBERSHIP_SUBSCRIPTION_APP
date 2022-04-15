import 'package:flutter/material.dart';
import 'package:flutter_auth/Activities/activitydart/floorworkouts.dart';
import 'package:flutter_auth/Activities/Screen/floorworkouts_details_screen.dart';

//lib>screens>floorworkouts_list_screen.dart

class FloorworkoutsListScreen extends StatelessWidget {
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
              Floorworkouts floorworkouts = gymList[index];
              return Card(
                child: ListTile(
                  title: Text(floorworkouts.title),
                  subtitle: Text(floorworkouts.category.toString()),
                  leading: Image.network(floorworkouts.imageUrl),
                  trailing: Icon(Icons.arrow_forward_rounded),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FloorworkoutsDetailsScreen(floorworkouts)));
                  },
                ),
              );
            }));
  }
}
