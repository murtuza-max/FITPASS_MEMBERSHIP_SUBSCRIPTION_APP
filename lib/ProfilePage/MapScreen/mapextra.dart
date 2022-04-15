import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_auth/ProfilePage/MapScreen/city_data.dart';
import 'package:flutter_auth/ProfilePage/MapScreen/directions_model.dart';
import 'package:flutter_auth/ProfilePage/MapScreen/search_widget.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({Key? key}) : super(key: key);

  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController googleMapController;
  String ? searchAddr;
  Directions ? _info;
  static const CameraPosition initialCameraPosition = CameraPosition(target: LatLng(23.0225, 72.5714), zoom: 14);

  Set<Marker> markers = {};
  var endPositionlat;
  var endPositionlong;

  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.black,
        points: polylineCoordinates,
        width: 1);
    polylines[id] = polyline;
    setState(() {});
  }

  _getPolyline() async {
    Position position = await _determinePosition();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyBRT_eJWp83FyGvv9tWqvITAsV4uGkam6w",
        PointLatLng(position.latitude, position.longitude),
        PointLatLng(endPositionlat, endPositionlong),
        travelMode: TravelMode.driving);
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            polylines: Set<Polyline>.of(polylines.values),
            initialCameraPosition: initialCameraPosition,
            markers: {
              ahmedabad1Marker,
              ahmedabad2Marker,
              ahmedabad3Marker,
              ahmedabad4Marker,
              ahmedabad5Marker,
              nadiad1Marker,
              nadiad2Marker,
              nadiad3Marker,
              nadiad4Marker,
              nadiad5Marker,
            },
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },

            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
          /*Padding(
            padding: const EdgeInsets.fromLTRB(150, 580, 3, 2),
            child: FloatingActionButton.extended(
              onPressed: () async {
                Position position = await _determinePosition();

                googleMapController.animateCamera(
                  CameraUpdate.newCameraPosition(CameraPosition(
                      target: LatLng(position.latitude, position.longitude),
                      zoom: 14)),
                );

                markers.add(Marker(
                    markerId: MarkerId('currentLocation'),
                    position: LatLng(position.latitude, position.longitude),
                    infoWindow: InfoWindow(title: "Current Location")));

                setState(() {});
              },
              label: const Text("Current Location"),
              icon: const Icon(Icons.location_history),
            ),
          ),*/
          Positioned(
            top: 60.0,
            right: 15.0,
            left: 15.0,
            child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white70,

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

          ),

          if (_info != null)
            Positioned(
              top: 50,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    )

                  ],
                ),
                child: Text(
                  '${_info!.totalDistance}, ${_info!.totalDuration}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  searchandNavigate() async {
    final GoogleMapController controller = await _controller.future;
    locationFromAddress(searchAddr!).then((result) {
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target:
          LatLng(result[0].latitude, result[0].longitude),
          zoom: 10.0)));
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
  ////////////////

  Marker ahmedabad1Marker = Marker(
    markerId: MarkerId('am1'),
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
    markerId: MarkerId('am3'),
    position: const LatLng(23.020078, 72.559718),
    infoWindow: const InfoWindow(title: 'Fitness Culture'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueViolet,
    ),
  );

//New York Marker

  Marker ahmedabad4Marker = Marker(
    markerId: MarkerId('am4'),
    position: const LatLng(23.011433, 72.563141),
    infoWindow: const InfoWindow(title: 'Blach Rhino Fitness'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueViolet,
    ),
  );

  Marker ahmedabad5Marker = Marker(
    markerId: MarkerId('am5'),
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
    markerId: MarkerId('na2'),
    position: const LatLng(22.691886, 72.848276),
    infoWindow: const InfoWindow(title: 'Ultimate Fitness'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueViolet,
    ),
  );
  Marker nadiad3Marker = Marker(
    markerId: MarkerId('na3'),
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
}
