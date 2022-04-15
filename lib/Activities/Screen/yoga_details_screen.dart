import 'package:flutter/material.dart';
import 'package:flutter_auth/Activities/activitydart/yog.dart';

//lib>screens>yoga_details_screen.dart

class YogaDetailsScreen extends StatelessWidget {
  final Yoga gym;
  var clubname;
  YogaDetailsScreen(this.gym,this.clubname);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(50, 3, 16, 4),
          child: Text(gym.title),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                gym.imageUrl,
                height: 500,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  gym.sc,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 22.0,color: Colors.deepPurple,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                 clubname,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0,color: Color.fromARGB(255, 16, 153, 216),fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  gym.sd,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 22.0,color: Colors.deepPurple,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  gym.description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0,color: Color.fromARGB(255, 16, 153, 216),fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  gym.st,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 22.0,color: Colors.deepPurple,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  gym.timmings,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0,color: Color.fromARGB(255, 16, 153, 216),fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  gym.sa,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 22.0,color: Colors.deepPurple,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  gym.address,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0,color: Color.fromARGB(255, 16, 153, 216),fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}