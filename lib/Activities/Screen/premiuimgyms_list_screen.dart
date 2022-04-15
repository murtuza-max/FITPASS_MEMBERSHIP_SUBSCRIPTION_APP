import 'package:flutter/material.dart';
import 'package:flutter_auth/Activities/activitydart/premiuimgyms.dart';
import 'package:flutter_auth/Activities/Screen/premiuimgyms_details_screen.dart';
//lib>screens>premiumgyms_list_screen.dart

class PremiumgymsListScreen extends StatelessWidget {
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
              PremiumGym premiumgym = gymList[index];

              return Card(
                child: ListTile(
                  title: Text(premiumgym.title),
                  subtitle: Text("Premium club"),
                  leading: Image.network(premiumgym.imageUrl),
                  trailing: Icon(Icons.arrow_forward_rounded),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PremiumgymsDetailsScreen(premiumgym,clubname)));
                  },
                ),
              );
            }));
  }
}