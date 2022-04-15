import 'package:flutter_auth/ProfilePage/MapScreen/filter_local_list_page.dart';
//import 'package:search_bar/page/filter_network_list_page.dart';
import 'package:flutter/material.dart';

class FitMap extends StatelessWidget {
  static final String title = 'FITNESS CLUBS';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.purple),
        home: FilterLocalListPage(),
      );
}
