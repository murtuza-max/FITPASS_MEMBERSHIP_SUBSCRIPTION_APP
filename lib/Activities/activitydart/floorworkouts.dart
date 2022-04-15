import 'package:flutter/material.dart';

//lib>model>floorworkouts.dart
class Floorworkouts {
  String title;
  String description;
  String imageUrl;
  String timmings;
  String address;
  String sd;
  String st;
  String sa;
  String sc;
  String category;

  Floorworkouts(
      {
        required this.title,
        required this.description,
        required this.imageUrl,
        required this.timmings,
        required this.address,
        required this.sd,
        required this.st,
        required this.sa,
        required this.sc,
        required this.category});
}

List<Floorworkouts> gymList = [
  Floorworkouts(
      title: 'SFW THE GYM',
      sd: 'SPECIAL ACTIVITIES',
      description: 'Floor Workout, Kick-Boxing',
      st: 'TIMMINGS',
      timmings: '3:30-5:30 ',
      sa: 'ADDRESS',
      address:
          'First floor, Hi-Tech Building, Opp NID, Nr. Diwan Ballubhai School, Paldi, Ahmedabad, Gujarat 380007',
      sc: 'CATEGORY',
      category: 'Premium',
      imageUrl:
          'https://sulcdn.azureedge.net/biz-live/img/1770366-5193105-28022017171613.jpeg'),
  Floorworkouts(
      title: 'BLACK RHINO FITNESS',
      sd: 'SPECIAL ACTIVITIES',
      description: 'Pilates, Cardio',
      st: 'TIMMINGS',
      timmings: '3:30-5:30 ',
      sa: 'ADDRESS',
      address:
          'Shivalik 5, 501, New Mahalaxmi Cross Rd, above Indore chat, Paldi, Ahmedabad, Gujarat 380007',
      sc: 'CATEGORY',
      category: 'Pro',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfcjU-0466yzDTxr0h2k_FD00ClazWHpzTYr5A4H3AOSHXdXl12ErxjAtYpuMhgmII3AQ&usqp=CAU'),
  Floorworkouts(
      title: 'FITNESS GYM',
      sd: 'SPECIAL ACTIVITIES',
      description: 'Calesthenics, Floor Workouts',
      st: 'TIMMINGS',
      timmings: '3:30-5:30 ',
      sa: 'ADDRESS',
      address:
          '321, B- Block, 3rd Floor ,geetamandir S.T. Bus Stand, Hub Town, Ahmedabad, Gujarat 380022',
      sc: 'CATEGORY',
      category: 'Elite',
      imageUrl:
          'https://c8.alamy.com/comp/M6Y8CT/fitness-gym-logo-with-athletic-man-training-black-on-white-background-M6Y8CT.jpg'),
  Floorworkouts(
      title: 'YM FITNESS STUDIO',
      sd: 'SPECIAL ACTIVITIES',
      description: 'Gym Workout, Cardio',
      st: 'TIMMINGS',
      timmings: '3:30-5:30 ',
      sa: 'ADDRESS',
      address:
          '2ND FLOOR ABOVE HDFC BANK NR ELECTRICITY HOUSE, Relief Rd, Ahmedabad, Gujarat 380001',
      sc: 'CATEGORY',
      category: 'Premium',
      imageUrl: 'https://cdn.fitimg.in/studio_logo_4B68A6872FBE5F.png'),
  Floorworkouts(
      title: 'PLANET FITNESS',
      sd: 'SPECIAL ACTIVITIES',
      description: 'Yoga, Floor Workout, Swimming',
      st: 'TIMMINGS',
      timmings: '3:30-5:30 ',
      sa: 'ADDRESS',
      address:
          ' 3rd floor, Western city complex, Pij Rd, Napad, Nadiad, Gujarat 387002',
      sc: 'CATEGORY',
      category: 'Pro',
      imageUrl:
          'https://www.bbbswnc.org/wp-content/uploads/2018/05/Planet-Fitness.jpg'),
  Floorworkouts(
      title: 'ULTIMATE FITNESS CLUB',
      sd: 'SPECIAL ACTIVITIES',
      description: 'Yoga, Floor Workout, Dance',
      st: 'TIMMINGS',
      timmings: '3:30-5:30 ',
      sa: 'ADDRESS',
      address:
          'New Ultimate Fitness, Gitanjali Crossing, Pij Rd, Nadiad, Gujarat 387002',
      sc: 'CATEGORY',
      category: 'Elite',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPpnnCH_PzBTfDh__vg967_shTLl9jACewuA&usqp=CAU'),
  Floorworkouts(
      title: 'PRIME FITNESS',
      sd: 'SPECIAL ACTIVITIES',
      description: 'Yoga, Floor Workout, Dance',
      st: 'TIMMINGS',
      timmings: '5:30-22:30 ',
      sa: 'ADDRESS',
      address:
          'Petlad Rd, opp. Zalak Police Choki, Bhakti Nagar, Nadiad, Gujarat 387001',
      sc: 'CATEGORY',
      category: 'Premium',
      imageUrl:
          'https://images-platform.99static.com/n5HwhDxydIlPFP236V62p2YaJFA=/611x269:1220x878/500x500/top/smart/99designs-contests-attachments/75/75106/attachment_75106703'),
  Floorworkouts(
      title: 'BLUE HEAVEN SWIM AND GYM',
      sd: 'SPECIAL ACTIVITIES',
      description: 'Yoga, Floor Workout, Dance',
      st: 'TIMMINGS',
      timmings: '3:30-5:30 ',
      sa: 'ADDRESS',
      address: 'Manjipura Rd, Manjipura, Nadiad, Gujarat 387001',
      sc: 'CATEGORY',
      category: 'Pro',
      imageUrl:
          'https://vfitnessclub.com/uploadfiles/thumbs/nadiad-manjipura-Blue-Heaven-Swim-&-Gym_3260_MzI2MA_MTEwMzM.JPG'),
];
