import 'package:flutter/material.dart';
import 'package:flutter_auth/Activities/activitydart/elitegyms.dart';
import 'package:flutter_auth/Activities/Screen/elitegyms_details_screen.dart';
//lib>screens>elitegyms_list_screen.dart

class ElitegymsListScreen extends StatelessWidget {
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
              EliteGym elitegym = gymList[index];
              return Card(
                child: ListTile(
                  title: Text(elitegym.title),
                  //subtitle: Text(elitegym.category.toString()),
                  subtitle: Text("Elite club"),
                  leading: Image.network(elitegym.imageUrl),
                  trailing: Icon(Icons.arrow_forward_rounded),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ElitegymsDetailsScreen(elitegym)));
                  },
                ),
              );
            }));
  }
}