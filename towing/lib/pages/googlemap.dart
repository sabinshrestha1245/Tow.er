import 'dart:async';
import 'package:Tower/pages/location_services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  TextEditingController _searchController = TextEditingController();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  final List<Marker> _markers = [];
  final List<Marker> _list = [
    /*const Marker(
      markerId: MarkerId('_kGooglePlex'),
      infoWindow: InfoWindow(title: 'Google Plex'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(37.42796133580664, -122.085749655962),
    ),*/
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

  @override
  void initState() {
    super.initState();
    _markers.addAll(_list);
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          //
          Container(
            decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(12)),
            padding: EdgeInsets.all(12),
            //alignment: Alignment.centerLeft,
            child: TextField(
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Set your Location',
                labelText: 'Set Your Location',
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(width: 1, style: BorderStyle.none)
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.location_pin),
                ),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  markers: Set<Marker>.of(_markers),
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
                Positioned(
                  right:20,
                  top: 10,
                  child: FloatingActionButton(
                    onPressed: () {
                      getUserCurrentLocation().then((value) async {
                        print('my current location');
                        print(value.latitude.toString() + " " + value.longitude.toString());

                        _markers.add(Marker(
                            markerId: MarkerId('3'),
                            icon: BitmapDescriptor.defaultMarker,
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
                ),
              ],
            ),
          ),


        ],
      );
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          getUserCurrentLocation().then((value) async {
            print('my current location');
            print(value.latitude.toString() + " " + value.longitude.toString());

            _markers.add(Marker(
                markerId: MarkerId('3'),
                icon: BitmapDescriptor.defaultMarker,
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
      ),*/

  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("error" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  Future<void> _goToPlace(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12),
      ),
    );
  }
}
