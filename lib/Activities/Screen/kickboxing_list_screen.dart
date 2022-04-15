import 'package:flutter/material.dart';
import 'package:flutter_auth/Activities/activitydart/kickboxing.dart';
import 'package:flutter_auth/Activities/Screen/kickboxing_details_screen.dart';

//lib>screens>kickboxing_list_screen.dart

class KickboxingListScreen extends StatelessWidget {
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
              Kickboxing kickboxing = gymList[index];
              return Card(
                child: ListTile(
                  title: Text(kickboxing.title),
                  subtitle: Text("Premium club"),
                  leading: Image.network(kickboxing.imageUrl),
                  trailing: Icon(Icons.arrow_forward_rounded),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KickboxingDetailsScreen(kickboxing,clubname)));
                  },
                ),
              );
            }));
  }
}