import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/services.dart' show rootBundle;

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController mapController;
  late String _mapStyle;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(27.700769, 85.300140),
    zoom: 14.4746,
  );
  final List<Marker> _markers=[];
  late LatLng latlng_global;
  addMarker(LatLng latLng) async {
    _markers.add(Marker(
        markerId: const MarkerId("adding markers"),
        draggable: true,
        position: latLng,
        onTap: (){

        },
        onDrag: (newlatlng){
          latlng_global = newlatlng;
          setState(() {

          });
        }
    ));
  }

  static const CameraPosition _kLake = CameraPosition(
    // bearing: 192.8334901395799,
      target: LatLng(28.2096, 83.9856),
      tilt: 20,
      zoom: 15);
  @override
  void initState() {
    super.initState();

    rootBundle.loadString('images/map.txt').then((string) {
      _mapStyle = string;
    });
  }
  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: GoogleMap(
          mapType: MapType.hybrid,

          initialCameraPosition: _kGooglePlex,
          onTap: (latlong){
            setState(() {
              addMarker(latlong);
            });
          },
          onMapCreated: (GoogleMapController controller) {
            mapController= controller;
            mapController.setMapStyle(_mapStyle);

            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}