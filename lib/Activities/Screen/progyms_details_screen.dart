import 'package:flutter/material.dart';
import 'package:flutter_auth/Activities/activitydart/progyms.dart';

//lib>screens>progyms_details_screen.dart

class ProgymsDetailsScreen extends StatelessWidget {
  final ProGym gym;
  var clubname="Pro club";

  ProgymsDetailsScreen(this.gym);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gym.title),
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