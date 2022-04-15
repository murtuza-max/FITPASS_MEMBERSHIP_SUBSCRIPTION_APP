import 'package:flutter/material.dart';
import 'package:flutter_auth/Activities/activitydart/pilates.dart';
import 'package:flutter_auth/Activities/Screen/pilates_details_screen.dart';

//lib>screens>pilates_list_screen.dart

class PilatesListScreen extends StatelessWidget {
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
              Pilates pilates = gymList[index];
              return Card(
                child: ListTile(
                  title: Text(pilates.title),
                  subtitle: Text("Pro clubs"),
                  leading: Image.network(pilates.imageUrl),
                  trailing: Icon(Icons.arrow_forward_rounded),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PilatesDetailsScreen(pilates,clubname)));
                  },
                ),
              );
            }));
  }
}