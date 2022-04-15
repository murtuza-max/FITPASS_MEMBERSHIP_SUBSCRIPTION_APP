import 'package:flutter/material.dart';
import 'package:flutter_auth/Activities/activitydart/progyms.dart';
import 'package:flutter_auth/Activities/Screen/progyms_details_screen.dart';
//lib>screens>progyms_list_screen.dart

class ProgymsListScreen extends StatelessWidget {
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
              ProGym progym = gymList[index];
              return Card(
                child: ListTile(
                  title: Text(progym.title),
                  subtitle: Text("Pro club"),
                  leading: Image.network(progym.imageUrl),
                  trailing: Icon(Icons.arrow_forward_rounded),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProgymsDetailsScreen(progym)));
                  },
                ),
              );
            }));
  }
}