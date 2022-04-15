import 'package:flutter_auth/ProfilePage/Packages/color_filters.dart';
import 'package:flutter_auth/ProfilePage/Packages/elite.dart';
import 'package:flutter_auth/ProfilePage/Packages/pro.dart';
import 'package:flutter_auth/ProfilePage/Packages/premium.dart';
import 'package:flutter/material.dart';

var titles = "Packages";

class PackageScreen extends StatefulWidget {
  @override
  _PackageScreenState createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(titles),
        ),
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
              image: NetworkImage(
                'https://media.istockphoto.com/photos/fitness-equipment-on-the-floor-at-the-gym-picture-id1287504319?b=1&k=20&m=1287504319&s=170667a&w=0&h=S8WDmnyexlQQ6nQhQByZ64RBMX_O7bMyT1ZgP0hteiY=',
              ),
              colorFilter: ColorFilters.greyscale,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Elite()));
                },
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              'ELITE MEMBERSHIP',
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
              image: NetworkImage(
                'https://media.istockphoto.com/photos/workout-gym-with-gym-equipment-picture-id1135188049?k=20&m=1135188049&s=612x612&w=0&h=fV8_RLPM-42RzX3VXLYNx90NWi2tXOAfazHODyTBj2E=',
              ),
              colorFilter: ColorFilters.greyscale,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Pro()));
                },
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              'PRO MEMBERSHIP',
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
              image: NetworkImage(
                'https://images4.alphacoders.com/692/thumb-1920-692043.jpg',
              ),
              colorFilter: ColorFilters.greyscale,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Premium()));
                },
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              'PREMIUM MEMBERSHIP',
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
