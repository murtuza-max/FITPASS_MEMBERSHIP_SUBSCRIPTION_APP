import 'package:flutter/material.dart';
import 'package:flutter_auth/Activities/activitydart/gymworkouts.dart';
import 'package:flutter_auth/Activities/Screen/gymworkouts_details_screen.dart';

//lib>screens>gymworkouts_list_screen.dart

class GymworkoutsListScreen extends StatelessWidget {
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
              Gymworkouts gymworkouts = gymList[index];
              return Card(
                child: ListTile(
                  title: Text(gymworkouts.title),
                  subtitle: Text(gymworkouts.category.toString()),
                  leading: Image.network(gymworkouts.imageUrl),
                  trailing: Icon(Icons.arrow_forward_rounded),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                GymworkoutsDetailsScreen(gymworkouts)));
                  },
                ),
              );
            }));
  }
}
