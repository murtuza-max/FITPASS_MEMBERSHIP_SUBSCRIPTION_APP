
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_auth/ProfilePage/MapScreen/city_data.dart';
import 'package:flutter_auth/ProfilePage/MapScreen/search_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//lib>homepage.dart
class MapScr extends StatefulWidget {
  const MapScr({Key? key}) : super(key: key);
  // String query = '';
  @override
  MapScrState createState() => MapScrState();
}

class MapScrState extends State<MapScr> {
  final Completer<GoogleMapController> _controller = Completer();
  // String query = '';
  late String searchAddr;

  @override
  void initState() {
    super.initState();
  }
  double zoomVal=5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          Positioned(
            top: 30.0,
            right: 15.0,
            left: 15.0,
            child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search City',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: searchandNavigate,
                      iconSize: 30.0,
                    )
                ),
                onChanged: (val) {
                  setState(() {
                    searchAddr = val;
                  });
                },
              ),
            ),

          )
          //buildSearch(),
          // _zoomminusfunction(),
          // _zoomplusfunction(),
          // _buildContainer(),
        ],
      ),
    );
  }
  searchandNavigate() async {
    final GoogleMapController controller = await _controller.future;
    locationFromAddress(searchAddr).then((result) {
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target:
          LatLng(result[0].latitude, result[0].longitude),
          zoom: 10.0)));
    });
  }
/* Widget _zoomminusfunction() {

    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
            icon: const Icon(FontAwesomeIcons.searchMinus,color:Color(0xff6200ee)),
            onPressed: () {
              zoomVal--;
             _minus( zoomVal);
            }),
    );
 }
 Widget _zoomplusfunction() {

    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
            icon: const Icon(FontAwesomeIcons.searchPlus,color:Color(0xff6200ee)),
            onPressed: () {
              zoomVal++;
              _plus(zoomVal);
            }),
    );
 }

 Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: const LatLng(23.0225, 72.5714), zoom: zoomVal)));
  }
  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: const LatLng(23.0225, 72.5714), zoom: zoomVal)));
  }


  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            const SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://i.ytimg.com/vi/wSNcXe28N2E/maxresdefault.jpg",
                  23.008286, 72.560490,"Life Fitness"),
            ),
            const SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://cdn.fitimg.in/studio_logo_95E088D8470FD6.jpg",
                  23.009391, 72.581501,"Fit Town"),
            ),
            const SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://b.fitn.in/f/c/16230/16230_1630481899216.jpg",
                  23.020078, 72.559718,"The Fitness Culture"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat,double long,String restaurantName) {
    return  GestureDetector(
        onTap: () {
          _gotoLocation(lat,long);
        },
        child:Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: const Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 180,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.fill,
                              image: NetworkImage(_image),
                            ),
                          ),),
                          Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: myDetailsContainer1(restaurantName),
                          ),
                        ),

                      ],)
                ),
              ),
            ),
    );
  }

  Widget myDetailsContainer1(String restaurantName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(restaurantName,
            style: const TextStyle(
                color: Color(0xff6200ee),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        const SizedBox(height:5.0),
        Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: const Text(
                "4.1",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
              Container(
                child: const Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: const Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: const Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: const Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: const Icon(
                  FontAwesomeIcons.solidStarHalf,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
               Container(
                  child: const Text(
                "(946)",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
            ],
          )),
          const SizedBox(height:5.0),
        Container(
                  child: const Text(
                "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
              const SizedBox(height:5.0),
        Container(
            child: const Text(
          "Closed \u00B7 Opens 17:00 Thu",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }*/

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  const CameraPosition(target: LatLng(23.0225, 72.5714), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          ahmedabad1Marker,ahmedabad2Marker,ahmedabad3Marker,ahmedabad4Marker,ahmedabad5Marker,nadiad1Marker,
          nadiad2Marker,nadiad3Marker,nadiad4Marker,nadiad5Marker,
        },
      ),
    );
  }

  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }
}

Marker ahmedabad1Marker = Marker(
  markerId:  MarkerId('am1'),
  position: const LatLng(23.008286, 72.56049040),
  infoWindow: const InfoWindow(title: 'Life Fitness'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker ahmedabad2Marker = Marker(
  markerId: MarkerId('am2'),
  position: const LatLng(23.009391, 72.581501),
  infoWindow: const InfoWindow(title: 'Fit Town'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker ahmedabad3Marker = Marker(
  markerId:  MarkerId('am3'),
  position: const LatLng(23.020078, 72.559718),
  infoWindow: const InfoWindow(title: 'Fitness Culture'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

//New York Marker

Marker ahmedabad4Marker = Marker(
  markerId:  MarkerId('am4'),
  position: const LatLng(23.011433, 72.563141),
  infoWindow: const InfoWindow(title: 'Blach Rhino Fitness'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker ahmedabad5Marker = Marker(
  markerId:  MarkerId('am5'),
  position: const LatLng(23.000053, 72.561961),
  infoWindow: const InfoWindow(title: 'Fitness18 Gym'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker nadiad1Marker = Marker(
  markerId: MarkerId('na1'),
  position: const LatLng(22.725724, 72.854859),
  infoWindow: const InfoWindow(title: 'Blue Heaven Swim & Gym'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker nadiad2Marker = Marker(
  markerId:  MarkerId('na2'),
  position: const LatLng(22.691886, 72.848276),
  infoWindow: const InfoWindow(title: 'Ultimate Fitness'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker nadiad3Marker = Marker(
  markerId:  MarkerId('na3'),
  position: const LatLng(22.721320, 72.860521),
  infoWindow: const InfoWindow(title: 'Planet Fitness'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker nadiad4Marker = Marker(
  markerId: MarkerId('na4'),
  position: const LatLng(22.673355, 72.865043),
  infoWindow: const InfoWindow(title: 'Prime Fitness'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker nadiad5Marker = Marker(
  markerId: MarkerId('na5'),
  position: const LatLng(22.688868, 72.864598),
  infoWindow: const InfoWindow(title: 'Santram Gym'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
String query = '';
Widget buildSearch() => SearchWidget(
  text: query,
  hintText: 'Search',
  onChanged: searchCity,
);

void searchCity(String query) {
  final cities = allCity.where((City) {
    final cityLower = City.city.toLowerCase();
    // final categoryLower = gym.category.toLowerCase();
    final searchLower = query.toLowerCase();

    return cityLower.contains(searchLower); //||
    // categoryLower.contains(searchLower);
  }).toList();

  //setState(() {
  //this.query = query;
  //this.cities = cities;
  //


}