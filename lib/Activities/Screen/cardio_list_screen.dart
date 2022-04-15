import 'package:flutter/material.dart';
import 'package:flutter_auth/Activities/activitydart/cardio.dart';
import 'package:flutter_auth/Activities/Screen/cardio_details_screen.dart';
//lib>screens>cardio_list_screen.dart

class CardioListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            padding: EdgeInsets.only(left: 54, top: 25, right: 16, bottom: 20),
            child: new Text('FITNESS CLUBS'),
          ), //Text('FITNESS CLUBS'),
        ),
        body: ListView.builder(
            itemCount: gymList.length,
            itemBuilder: (context, index) {
              Cardio cardio = gymList[index];
              return Card(
                child: ListTile(
                  title: Text(cardio.title),
                  subtitle: Text(cardio.category.toString()),
                  leading: Image.network(cardio.imageUrl),
                  trailing: Icon(Icons.arrow_forward_rounded),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CardioDetailsScreen(cardio)));
                  },
                ),
              );
            }));
  }
}
