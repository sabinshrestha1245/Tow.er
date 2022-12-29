import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/services.dart' show rootBundle;

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController mapController;
  late String _mapStyle;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(27.690050, 85.214494),
    zoom: 14.4746,
  );

  final List<Marker> _markers = [];
  final List<Marker> _list = [
    const Marker(
        markerId: MarkerId('1'),
        position: LatLng(27.690050, 85.214494),
        infoWindow: InfoWindow(title: 'My Home')),
    /* Marker(
        markerId: MarkerId(''),
        position: LatLng(27.684574, 85.316947),
        infoWindow: InfoWindow(
            title: 'Pcps College'
        )),*/
  ];
  loadData() {
    getUserCurrentLocation().then((value) async {
      print('my current location');
      print(value.latitude.toString() + " " + value.longitude.toString());

      _markers.add(Marker(
          markerId: MarkerId('3'),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: InfoWindow(title: 'My current location')));

      CameraPosition cameraPosition = CameraPosition(
          zoom: 14, target: LatLng(value.latitude, value.longitude));
      final GoogleMapController controller = await _controller.future;

      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      setState(() {});
    });
  }

  late LatLng latLng_global;
  /* void addMarker(LatLng latlng){
    // adding marker in the clicked latitude longitude
    _markers.add(Marker(
        markerId: MarkerId("adding markers"),
        draggable: true,
        position: LatLng(27.690050, 85.214494),
        onTap: (){
          //Show details of the place
          //Show distance
        },
        onDrag: (newlatlng){
          latLng_global = newlatlng;
          setState(() {
            //refresh page
          });
        }
    ));
  }*/

  static const CameraPosition _kLake = CameraPosition(
      // bearing: 192.8334901395799,
      target: LatLng(27.690050, 85.214494),
      tilt: 20,
      zoom: 15);

  @override
  void initState() {
    super.initState();
    _markers.addAll(_list);
    loadData();

    rootBundle.loadString('assets/map.txt').then((string) {
      _mapStyle = string;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: _kGooglePlex,
          markers: Set<Marker>.of(_markers),

          /* onTap: (latlong){
            setState(() {
              addMarker(latlong);
            });
          },*/
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
            mapController.setMapStyle(_mapStyle);

            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getUserCurrentLocation().then((value) async {
            print('my current location');
            print(value.latitude.toString() + " " + value.longitude.toString());

            _markers.add(Marker(
                markerId: MarkerId('3'),
                position: LatLng(value.latitude, value.longitude),
                infoWindow: InfoWindow(title: 'My current location')));

            CameraPosition cameraPosition = CameraPosition(
                zoom: 14, target: LatLng(value.latitude, value.longitude));
            final GoogleMapController controller = await _controller.future;

            controller
                .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
            setState(() {});
          });
        },
        child: Icon(Icons.my_location),
      ),
      /*floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.my_location),
      ),
      */
    );
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("error" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }
  /* Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
*/
}
