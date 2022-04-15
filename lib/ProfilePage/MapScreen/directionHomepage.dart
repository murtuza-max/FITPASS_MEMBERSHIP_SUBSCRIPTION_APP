import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_auth/ProfilePage/MapScreen/directions_model.dart';
import 'package:flutter_auth/ProfilePage/MapScreen/directions_repository.dart';

//lib>homepage.dart
class DirectionHomePage extends StatefulWidget {
  const DirectionHomePage({Key? key}) : super(key: key);

  @override
  _DirectionHomePageState createState() => _DirectionHomePageState();
}

class _DirectionHomePageState extends State<DirectionHomePage> {
  final Completer<GoogleMapController> _controller = Completer();
  Marker ? _origin;
  Marker ? _destination;
  GoogleMapController ? _googleMapController;
  String ? searchAddr;
  Directions ? _info;
  CameraPosition _initialCameraPosition= CameraPosition(target: LatLng(23.0225, 72.5714), zoom: 14.0);

  @override
  void initState() {
    super.initState();
  }

  double zoomVal=5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
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



  Widget _buildGoogleMap(BuildContext context) {
    return Container(
     // height: MediaQuery.of(context).size.height,
      //width: MediaQuery.of(context).size.width,
      child: GoogleMap(

        mapType: MapType.normal,
        scrollGesturesEnabled: true,
        rotateGesturesEnabled: true,
        mapToolbarEnabled: true,
        compassEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: CameraPosition(target: LatLng(23.0225, 72.5714), zoom: 14.0),
        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,

        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          ahmedabad1Marker,ahmedabad2Marker,ahmedabad3Marker,ahmedabad4Marker,ahmedabad5Marker,nadiad1Marker,
          nadiad2Marker,nadiad3Marker,nadiad4Marker,nadiad5Marker,
          if (_origin != null)  _origin!,
          if (_destination !=null) _destination!
        },
        polylines: {
          if (_info != null)
            Polyline(
              polylineId: const PolylineId('overview_polyline'),
              color: Colors.orange,
              width: 5,
              points: _info!.polylinePoints
                  .map((e) => LatLng(e.latitude, e.longitude))
                  .toList(),
            )
        },
        onLongPress: _addMarker,
      ),

    );
  }
  void _addMarker(LatLng pos) async {
    if (_origin == null || (_origin != null && _destination != null)){

      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          position: pos,
        );
        // _destination = null;
        // _info = null;
      });
    } else {

      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
        );
      });

      final directions = await DirectionsRepository()
          .getDirections(origin: _origin!.position, destination: pos);
      setState(() => _info = directions!);


    }
  }

  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }
  @override
  void dispose(){
    _googleMapController!.dispose();
    super.dispose();
  }
}

Marker ahmedabad1Marker = Marker(
  markerId: const MarkerId('am1'),
  position: const LatLng(23.008286, 72.56049040),
  infoWindow: const InfoWindow(title: 'Life Fitness'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker ahmedabad2Marker = Marker(
  markerId: const MarkerId('am2'),
  position: const LatLng(23.009391, 72.581501),
  infoWindow: const InfoWindow(title: 'Fit Town'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker ahmedabad3Marker = Marker(
  markerId: const MarkerId('am3'),
  position: const LatLng(23.020078, 72.559718),
  infoWindow: const InfoWindow(title: 'Fitness Culture'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

//New York Marker

Marker ahmedabad4Marker = Marker(
  markerId: const MarkerId('am4'),
  position: const LatLng(23.011433, 72.563141),
  infoWindow: const InfoWindow(title: 'Blach Rhino Fitness'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker ahmedabad5Marker = Marker(
  markerId: const MarkerId('am5'),
  position: const LatLng(23.000053, 72.561961),
  infoWindow: const InfoWindow(title: 'Fitness18 Gym'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker nadiad1Marker = Marker(
  markerId: const MarkerId('na1'),
  position: const LatLng(22.725724, 72.854859),
  infoWindow: const InfoWindow(title: 'Blue Heaven Swim & Gym'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker nadiad2Marker = Marker(
  markerId: const MarkerId('na2'),
  position: const LatLng(22.691886, 72.848276),
  infoWindow: const InfoWindow(title: 'Ultimate Fitness'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker nadiad3Marker = Marker(
  markerId: const MarkerId('na3'),
  position: const LatLng(22.721320, 72.860521),
  infoWindow: const InfoWindow(title: 'Planet Fitness'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker nadiad4Marker = Marker(
  markerId: const MarkerId('na4'),
  position: const LatLng(22.673355, 72.865043),
  infoWindow: const InfoWindow(title: 'Prime Fitness'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker nadiad5Marker = Marker(
  markerId: const MarkerId('na5'),
  position: const LatLng(22.688868, 72.864598),
  infoWindow: const InfoWindow(title: 'Santram Gym'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

