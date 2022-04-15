import 'package:flutter/material.dart';

//lib>model>swimming.dart
class Swimming {
  String  title;
  String  description;
  String  imageUrl;
  String  timmings;
  String  address;
  String  sd;
  String  st;
  String  sa;
  String  sc;
  String  category;

  Swimming(
      { required this.title,
        required  this.description,
        required  this.imageUrl,
        required  this.timmings,
        required this.address,
        required this.sd,
        required  this.st,
        required this.sa,
        required  this.sc,
        required  this.category});
}

List<Swimming> gymList = [
  Swimming(
      title: 'LIFE FITNESS',
      sd: 'SPECIAL ACTIVITIES',
      description:
      'Floor Workout, Kick-Boxing',
      st: 'TIMMINGS',
      timmings : '3:30-5:30 ',
      sa: 'ADDRESS',
      address :
      ' 5/6/7th floor, Attrey Rudra Business Hub, opposite Sankalp Restaurant, Maninagar, Ahmedabad, Gujarat 380008',
      sc: 'CATEGORY',
      category:  'Premium',
      imageUrl:
      'https://pbs.twimg.com/profile_images/905734932017713152/tJJ-yq6e_400x400.jpg'),
  Swimming(
      title: 'GOLDS GYM',
      sd: 'SPECIAL ACTIVITIES',
      description:
      'Floor Workout, Kick-Boxing',
      st: 'TIMMINGS',
      timmings : '3:30-5:30 ',
      sa: 'ADDRESS',
      address :
      ' 5/6/7th floor, Attrey Rudra Business Hub, opposite Sankalp Restaurant, Maninagar, Ahmedabad, Gujarat 380008',
      sc: 'CATEGORY',
      category:  'Premium',
      imageUrl:
      'https://image3.mouthshut.com/images/imagesp/925748681s.jpg'),
  Swimming(
      title: 'SFW THE GYM',
      sd: 'SPECIAL ACTIVITIES',
      description:
      'Floor Workout, Kick-Boxing',
      st: 'TIMMINGS',
      timmings : '3:30-5:30 ',
      sa: 'ADDRESS',
      address :
      'First floor, Hi-Tech Building, Opp NID, Nr. Diwan Ballubhai School, Paldi, Ahmedabad, Gujarat 380007',
      sc: 'CATEGORY',
      category:  'Premium',
      imageUrl:
      'https://sulcdn.azureedge.net/biz-live/img/1770366-5193105-28022017171613.jpeg'),
  Swimming(
      title: 'BLACK RHINO FITNESS',
      sd: 'SPECIAL ACTIVITIES',
      description:
      'Pilates, Cardio',
      st: 'TIMMINGS',
      timmings : '3:30-5:30 ',
      sa: 'ADDRESS',
      address :
      'Shivalik 5, 501, New Mahalaxmi Cross Rd, above Indore chat, Paldi, Ahmedabad, Gujarat 380007',
      sc: 'CATEGORY',
      category:  'Pro',
      imageUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfcjU-0466yzDTxr0h2k_FD00ClazWHpzTYr5A4H3AOSHXdXl12ErxjAtYpuMhgmII3AQ&usqp=CAU'),
  Swimming(
      title: 'FITNESS GYM',
      sd: 'SPECIAL ACTIVITIES',
      description:
      'Calesthenics, Floor Workouts',
      st: 'TIMMINGS',
      timmings : '3:30-5:30 ',
      sa: 'ADDRESS',
      address :
      '321, B- Block, 3rd Floor ,geetamandir S.T. Bus Stand, Hub Town, Ahmedabad, Gujarat 380022',
      sc: 'CATEGORY',
      category:  'Elite',
      imageUrl:
      'https://c8.alamy.com/comp/M6Y8CT/fitness-gym-logo-with-athletic-man-training-black-on-white-background-M6Y8CT.jpg'),


];