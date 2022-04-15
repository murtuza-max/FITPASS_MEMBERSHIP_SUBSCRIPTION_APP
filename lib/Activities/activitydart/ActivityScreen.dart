import 'package:flutter_auth/Activities/Screen/calisthenics_details_screen.dart';
import 'package:flutter_auth/Activities/activitydart/color_filters.dart';
import 'package:flutter_auth/Activities/Screen/dance_list_screen.dart';
import 'package:flutter_auth/Activities/Screen/floorworkouts_list_screen.dart';

import 'package:flutter_auth/Activities/Screen/gymworkouts_list_screen.dart';
import 'package:flutter_auth/Activities/Screen/kickboxing_list_screen.dart';
import 'package:flutter_auth/Activities/Screen/pilates_list_screen.dart';
import 'package:flutter_auth/Activities/Screen/swimming_list_screen.dart';
import 'package:flutter_auth/Activities/Screen/yoga_list_screen.dart';
import 'package:flutter_auth/Activities/Screen/cardio_list_screen.dart';
import 'package:flutter_auth/Activities/Screen/zumba_list_screen.dart';

import 'package:flutter/material.dart';

import '../Screen/calisthenics_list_screen.dart';
//import 'package:fitness_activities/pro.dart';
//import 'package:fitness_activities/premium.dart';

String title = "Activities";

class ActivitiesScreen extends StatefulWidget {
  @override
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body:Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 209, 178, 214),
                  Color.fromARGB(255, 148, 175, 187),
                ]),
          ),
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              buildCardioCard(),
              buildYogaCard(),
              buildZumbaCard(),
              buildSwimmingCard(),
              buildCalisthenicsCard(),
              buildKickBoxingCard(),
              buildDanceCard(),
              buildPilatesCard(),
              buildGymWorkoutsCard(),
              buildFloorWorkoutsCard(),
            ],
          ),
        )

      );

  Widget buildCardioCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://img.freepik.com/free-photo/attractive-young-woman-her-trainer-running-treadmill-gym_496169-2730.jpg?size=626&ext=jpg&ga=GA1.2.1438891066.1647391771',
              ),
              //colorFilter: ColorFilters.greyscale,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CardioListScreen()));
                },
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              'CARDIO',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );
  Widget buildYogaCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://img.freepik.com/free-photo/banner-web-page-cover-template-group-diversity-practicing-yoga-class_41418-3641.jpg?w=1380',
              ),
              //colorFilter: ColorFilters.greyscale,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => YogaListScreen()));
                },
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              'YOGA',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );
  Widget buildZumbaCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://media.istockphoto.com/photos/glad-positive-people-learning-zumba-steps-picture-id1289957683?b=1&k=20&m=1289957683&s=170667a&w=0&h=F6M9ZaEn5-JNToGf2NvB7Zty7Y5x3PGgZ0yNHK7L3SU=',
              ),
              //  colorFilter: ColorFilters.greyscale,
               child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ZumbaListScreen()));
                },
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              'ZUMBA',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );
  Widget buildSwimmingCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://cdn.pixabay.com/photo/2022/02/10/01/30/swimming-7004451__340.jpg',
              ),
              //colorFilter: ColorFilters.greyscale,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SwimmingListScreen()));
                },
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              'SWIMMING',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );
  Widget buildCalisthenicsCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://t4.ftcdn.net/jpg/02/12/62/67/240_F_212626796_pTctF8huPelO2stkl4Mxv6gkdbZxUGbA.jpg',
              ),
              // colorFilter: ColorFilters.greyscale,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CalisthenicsListScreen()));
                },
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              'CALISTHENICS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );
  Widget buildKickBoxingCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://media.istockphoto.com/photos/kickboxing-woman-in-activewear-and-red-kickboxing-gloves-on-black-a-picture-id1281286848?b=1&k=20&m=1281286848&s=170667a&w=0&h=r1gDT_nu1SvVX8YV6OwY_BuuT0ilKxhemiOMs59G4GE=',
              ),
              // colorFilter: ColorFilters.greyscale,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => KickboxingListScreen()));
                },
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              'KICK BOXING',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );
  Widget buildDanceCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://global-uploads.webflow.com/5e2b8863ba7fff8df8949888/5f1a56d235effd975d9f9712_DSC00405-p-1600.jpeg',
              ),
              // colorFilter: ColorFilters.greyscale,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DanceListScreen()));
                },
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              'DANCE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );
  Widget buildPilatesCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://img.freepik.com/free-photo/woman-doing-pilates-reformer_1303-11666.jpg?size=626&ext=jpg&ga=GA1.2.1438891066.1647391771',
              ),
              //  colorFilter: ColorFilters.greyscale,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PilatesListScreen()));
                },
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              'PILATES',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );
  Widget buildGymWorkoutsCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://img.freepik.com/free-photo/male-athlete-training-hard-gym-fitness-healthy-life-concept_155003-26303.jpg?size=626&ext=jpg&ga=GA1.1.1438891066.1647391771',
              ),
              //  colorFilter: ColorFilters.greyscale,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GymworkoutsListScreen()));
                },
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              'GYM WORKOUTS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );
  Widget buildFloorWorkoutsCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://media.self.com/photos/599714a044b4f8035818a0ff/2:1/w_4275,h_2137,c_limit/GettyImages-691038873.jpg',
              ),
              //  colorFilter: ColorFilters.greyscale,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FloorworkoutsListScreen()));
                },
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              'FLOOR WORKOUTS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );
}
/*
import 'package:flutter_auth/Activities/activitydart/color_filters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Activities/activitydart/elite.dart';
import 'package:flutter_auth/Activities/activitydart/pro.dart';
import 'package:flutter_auth/Activities/activitydart/premiuim.dart';
String title = "Activities";

class ActivitiesScreen extends StatefulWidget {
  @override
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
    /*appBar: AppBar(
      title: Text(widget.title),
    ),*/
    body: ListView(
      padding: EdgeInsets.all(16),
      children: [
        buildEliteCard(),
        buildProCard(),
        buildPremiumCard(),
      ],
    ),
  );

  Widget buildEliteCard() => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Ink.image(
          image: AssetImage(
            'assets/images/elt-lst.jpg',
          ),
          //colorFilter: ColorFilters.greyscale,
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Elite()));
            },
          ),
          height: 240,
          fit: BoxFit.cover,
        ),
        Text(
          'ELITE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ],
    ),
  );
  Widget buildProCard() => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Ink.image(
          image: AssetImage(
            'assets/images/prio.jpg',
          ),
          // colorFilter: ColorFilters.greyscale,
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Pro()));
            },
          ),
          height: 240,
          fit: BoxFit.cover,
        ),
        Text(
          'PRO',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ],
    ),
  );
  Widget buildPremiumCard() => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Ink.image(
          image: AssetImage(
            'assets/images/prm.jpg',
          ),
          // colorFilter: ColorFilters.greyscale,
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Premium()));
            },
          ),
          height: 240,
          fit: BoxFit.cover,
        ),
        Text(
          'PREMIUM',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ],
    ),
  );

}*/