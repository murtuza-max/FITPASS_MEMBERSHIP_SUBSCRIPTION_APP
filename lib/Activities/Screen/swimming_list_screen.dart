import 'package:flutter_auth/Activities/activitydart/swimming.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Activities/Screen/swimming_details_screen.dart';

//lib>screens>swimming_list_screen.dart

class SwimmingListScreen extends StatelessWidget {
  var clubname="Premium club";
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
              Swimming swimming = gymList[index];
              return Card(
                child: ListTile(
                  title: Text(swimming.title),
                  subtitle: Text("Premium club"),
                  leading: Image.network(swimming.imageUrl),
                  trailing: Icon(Icons.arrow_forward_rounded),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SwimmingDetailsScreen(swimming,clubname)));
                  },
                ),
              );
            }));
  }
}