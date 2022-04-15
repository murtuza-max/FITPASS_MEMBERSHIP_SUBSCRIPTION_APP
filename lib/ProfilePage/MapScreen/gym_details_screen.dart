import 'package:flutter/material.dart';

import 'package:flutter_auth/ProfilePage/MapScreen/gym.dart';

//lib>screens>gym_details_screen.dart
class GymDetailsScreen extends StatelessWidget {
  final Gym gym;

  GymDetailsScreen(this.gym);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 161, 134, 233),
        title: Container(
          padding: EdgeInsets.only(left: 54, top: 15, right: 16, bottom: 20),
          child: new Text(
            (gym.title),
          ),
          //title: Text(gym.title),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0,0,8,8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                gym.urlImage,
                height: 500,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  gym.sc,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  gym.category.toString(),
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 20.0, color: Color.fromARGB(255, 17, 116, 228)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  gym.sd,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  gym.description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 20.0, color: Color.fromARGB(255, 17, 116, 228)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  gym.st,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  gym.timmings,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 20.0, color: Color.fromARGB(255, 17, 116, 228)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  gym.sa,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0,8,8,12),
                child: Text(
                  gym.address,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 20.0, color: Color.fromARGB(255, 17, 116, 228)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
