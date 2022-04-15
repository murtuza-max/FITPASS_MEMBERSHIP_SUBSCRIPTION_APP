import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Activities/activitydart/elite.dart';
import 'package:flutter_auth/Activities/activitydart/pro.dart';
import 'package:flutter_auth/Activities/activitydart/premiuim.dart';
import 'package:neon/neon.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) => Scaffold(
        /*appBar: AppBar(
        title: Center(child: Text("HomeScreen")),
      ),*/
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 209, 178, 214),
                  Color.fromARGB(255, 148, 175, 187),
                 // Color.fromARGB(255, 26, 27, 28),
                 // Color.fromARGB(255, 89, 90, 92),
                ]),
          ),

          //color: Color.fromARGB(255, 207, 201, 240),
          child: ListView(
            padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
            children: [
              buildEliteCard(),
              buildProCard(),
              buildPremiumCard(),
            ],
          ),
        ),
      );

  Widget buildEliteCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          width: 600,
          height: 240,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 188, 106, 226),
                  Color.fromARGB(255, 102, 118, 142),
                  //Color.fromARGB(255, 49, 48, 48),
                  //Color.fromARGB(255, 49, 48, 48),
                ]),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 70, 10, 5),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.black38),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/gymper1.jpg'),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              Ink.image(
                image: AssetImage('assets/images/posters1.jpg'),
                //colorFilter: ColorFilters.greyscale,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Elite()));
                  },
                ),
                height: 240,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(45, 17, 22, 15),
                child: Neon(
                  text: 'ELITE FITPASS',
                  color: Colors.amber,
                  font: NeonFont.Beon,
                  flickeringText: true,
                  flickeringLetters: null,
                  glowingDuration: Duration(seconds: 1),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(60.0, 80, 1, 3),
                child: Neon(
                  text:
                      'Unlimited Access to', // Workout Classes, Elite Clubs daily at your Zone',
                  fontSize: 15,
                  color: Colors.teal,
                  font: NeonFont.NightClub70s,
                  flickeringText: false,
                  flickeringLetters: null,
                  //glowingDuration: Duration(seconds: 1),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(41.0, 104, 1, 3),
                child: Neon(
                  text:
                      'ALL ELITE Clubs.', // Workout Classes, Elite Clubs daily at your Zone',
                  fontSize: 15,
                  color: Colors.teal,
                  font: NeonFont.NightClub70s,
                  flickeringText: false,
                  flickeringLetters: null,
                  //glowingDuration: Duration(seconds: 1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(59.0, 125, 1, 3),
                child: Neon(
                  text: 'Workout Anywhere,',
                  fontSize: 15,
                  color: Colors.teal,
                  font: NeonFont.NightClub70s,
                  flickeringText: false,
                  flickeringLetters: null,
                  //glowingDuration: Duration(seconds: 1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(67.0, 148, 1, 3),
                child: Neon(
                  text: 'Anytime in any Zone',
                  fontSize: 15,
                  color: Colors.teal,
                  font: NeonFont.NightClub70s,
                  flickeringText: false,
                  flickeringLetters: null,
                  //glowingDuration: Duration(seconds: 1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 185, 1, 10),
                child: Neon(
                  text: '3 MONTHS ACCESS',
                  fontSize: 16,
                  color: Colors.amber,
                  font: NeonFont.Membra,
                  flickeringText: false,
                  flickeringLetters: null,
                  //glowingDuration: Duration(seconds: 1),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40.0, 208, 1, 12),
                child: Neon(
                  text: 'Just for RS.5000',
                  fontSize: 14,
                  color: Colors.amber,
                  font: NeonFont.Membra,
                  flickeringText: false,
                  flickeringLetters: null,
                  //glowingDuration: Duration(seconds: 1),
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildProCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        ///////
        child: Container(
          width: 600,
          height: 240,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  //Color.fromARGB(255, 109, 125, 131),
                  //Color.fromARGB(255, 117, 98, 111),
                  Color.fromARGB(255, 188, 106, 226),
                  Color.fromARGB(255, 102, 118, 142),
                  // Color.fromARGB(255, 206, 187, 243),
                  // Color.fromARGB(255, 148, 175, 187),
                ]),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 70, 10, 5),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.black38),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/gym4.webp'),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              Ink.image(
                image: AssetImage('assets/images/posters1.jpg'),
                //colorFilter: ColorFilters.greyscale,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Pro()));
                  },
                ),
                height: 240,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(45, 17, 22, 15),
                child: Neon(
                  text: 'PRO FITPASS',
                  color: Colors.amber,
                  font: NeonFont.Beon,
                  flickeringText: true,
                  flickeringLetters: null,
                  glowingDuration: Duration(seconds: 1),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(90.0, 80, 1, 3),
                child: Neon(
                  text:
                      'Unlimited Access to ALL', // Workout Classes, Elite Clubs daily at your Zone',
                  fontSize: 15,
                  color: Colors.teal,
                  font: NeonFont.NightClub70s,
                  flickeringText: false,
                  flickeringLetters: null,
                  //glowingDuration: Duration(seconds: 1),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(43.0, 104, 1, 3),
                child: Neon(
                  text:
                      'ELITE, PRO Clubs.', // Workout Classes, Elite Clubs daily at your Zone',
                  fontSize: 15,
                  color: Colors.teal,
                  font: NeonFont.NightClub70s,
                  flickeringText: false,
                  flickeringLetters: null,
                  //glowingDuration: Duration(seconds: 1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(55.0, 125, 1, 3),
                child: Neon(
                  text: 'Workout Anywhere,',
                  fontSize: 15,
                  color: Colors.teal,
                  font: NeonFont.NightClub70s,
                  flickeringText: false,
                  flickeringLetters: null,
                  //glowingDuration: Duration(seconds: 1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(63.0, 148, 1, 3),
                child: Neon(
                  text: 'Anytime in any Zone',
                  fontSize: 15,
                  color: Colors.teal,
                  font: NeonFont.NightClub70s,
                  flickeringText: false,
                  flickeringLetters: null,
                  //glowingDuration: Duration(seconds: 1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 185, 1, 10),
                child: Neon(
                  text: '6 MONTHS ACCESS',
                  fontSize: 16,
                  color: Colors.amber,
                  font: NeonFont.Membra,
                  flickeringText: false,
                  flickeringLetters: null,
                  //glowingDuration: Duration(seconds: 1),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(35.0, 208, 1, 12),
                child: Neon(
                  text: 'Just for RS.10000',
                  fontSize: 14,
                  color: Colors.amber,
                  font: NeonFont.Membra,
                  flickeringText: false,
                  flickeringLetters: null,
                  //glowingDuration: Duration(seconds: 1),
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildPremiumCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        ////////
        child: Container(
          width: 600,
          height: 240,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  //Color.fromARGB(255, 109, 125, 131),
                  //Color.fromARGB(255, 117, 98, 111),
                  Color.fromARGB(255, 188, 106, 226),
                  Color.fromARGB(255, 102, 118, 142),
                ]),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 70, 10, 5),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.black38),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/kick1.jpg'),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              Ink.image(
                image: AssetImage('assets/images/posters1.jpg'),
                //colorFilter: ColorFilters.greyscale,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Premium()));
                  },
                ),
                height: 240,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(45, 17, 22, 15),
                child: Neon(
                  text: 'PREMIUIM FITPASS',
                  color: Colors.amber,
                  font: NeonFont.Beon,
                  flickeringText: true,
                  flickeringLetters: null,
                  glowingDuration: Duration(seconds: 1),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(90.0, 80, 1, 3),
                child: Neon(
                  text:
                      'Unlimited Access to ALL', // Workout Classes, Elite Clubs daily at your Zone',
                  fontSize: 15,
                  color: Colors.teal,
                  font: NeonFont.NightClub70s,
                  flickeringText: false,
                  flickeringLetters: null,
                  //glowingDuration: Duration(seconds: 1),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(79.0, 104, 1, 3),
                child: Neon(
                  text:
                      'ELITE, PRO, PREMIUIM', // Workout Classes, Elite Clubs daily at your Zone',
                  fontSize: 15,
                  color: Colors.teal,
                  font: NeonFont.NightClub70s,
                  flickeringText: false,
                  flickeringLetters: null,
                  //glowingDuration: Duration(seconds: 1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(97.0, 125, 1, 3),
                child: Neon(
                  text: 'Clubs. Workout Anywhere,',
                  fontSize: 15,
                  color: Colors.teal,
                  font: NeonFont.NightClub70s,
                  flickeringText: false,
                  flickeringLetters: null,
                  //glowingDuration: Duration(seconds: 1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(60.0, 148, 1, 3),
                child: Neon(
                  text: 'Anytime in any Zone',
                  fontSize: 15,
                  color: Colors.teal,
                  font: NeonFont.NightClub70s,
                  flickeringText: false,
                  flickeringLetters: null,
                  //glowingDuration: Duration(seconds: 1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 185, 1, 10),
                child: Neon(
                  text: '9 MONTHS ACCESS',
                  fontSize: 16,
                  color: Colors.amber,
                  font: NeonFont.Membra,
                  flickeringText: false,
                  flickeringLetters: null,
                  //glowingDuration: Duration(seconds: 1),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(35.0, 206, 1, 12),
                child: Neon(
                  text: 'Just for RS.15000',
                  fontSize: 14,
                  color: Colors.amber,
                  font: NeonFont.Membra,
                  flickeringText: false,
                  flickeringLetters: null,
                  //glowingDuration: Duration(seconds: 1),
                ),
              ),
            ],
          ),
        ),
      );
}
