import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_auth/ProfilePage/startPage.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                StartApp()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 60,
                          child: Icon(
                            Icons.card_membership,
                                color: Colors.deepPurpleAccent,
                            size: 60,
                          ),

                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                        ),
                        Text("FITPASS",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          fontSize: 34
                        ),)
                      ],
                    ),
                  ),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(color: Colors.tealAccent,),
                      Padding(
                        padding: EdgeInsets.only(top: 20),

                      ),
                      Text("Fitness Clubs Membership Pass",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ],
                  ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
