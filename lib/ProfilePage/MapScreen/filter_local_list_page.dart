import 'package:flutter_auth/ProfilePage/MapScreen/gym_data.dart';
import 'package:flutter_auth/ProfilePage/MapScreen/FitMap.dart';
import 'package:flutter_auth/ProfilePage/MapScreen/gym.dart';
import 'package:flutter_auth/ProfilePage/MapScreen/gym_details_screen.dart';
import 'package:flutter_auth/ProfilePage/MapScreen/search_widget.dart';

import 'package:flutter/material.dart';

//lib>page>filter_local_list_page.dart
class FilterLocalListPage extends StatefulWidget {
  @override
  FilterLocalListPageState createState() => FilterLocalListPageState();
}

class FilterLocalListPageState extends State<FilterLocalListPage> {
  late List<Gym> gyms;
  String query = '';

  @override
  void initState() {
    super.initState();

    gyms = allGyms;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          /*appBar: AppBar(
          title: Text('FitMap'),
          centerTitle: true,
        ),*/
          body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 235, 195, 241),
                Color.fromARGB(255, 148, 175, 187),
              ]),
        ),
        child: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: gyms.length,
                itemBuilder: (context, index) {
                  final gym = gyms[index];

                  return buildBook(gym);
                },
              ),
            ),
          ],
        ),
      ));

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Search',
        onChanged: searchGym,
      );

  Widget buildBook(Gym gym) => ListTile(
      leading: Image.network(
        gym.urlImage,
        fit: BoxFit.cover,
        width: 50,
        height: 50,
      ),
      title: Text(gym.title),
      subtitle: Text(gym.category),
      trailing: Icon(Icons.arrow_forward_rounded),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => GymDetailsScreen(gym)));
      });

  void searchGym(String query) {
    final gyms = allGyms.where((gym) {
      final titleLower = gym.title.toLowerCase();
      final categoryLower = gym.category.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          categoryLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.gyms = gyms;
    });
  }
}
