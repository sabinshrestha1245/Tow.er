import 'dart:async';
import 'package:Tower/pages/location_services.dart';
import 'package:flutter/material.dart';
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

  static const Marker _kGooglePlexMarker = Marker(
    markerId: MarkerId ('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'Google Plex'),
    icon : BitmapDescriptor.defaultMarker,
    position:LatLng(37.42796133580664, -122.085749655962),);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                controller: _searchController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(hintText: 'Search Location'),
                onChanged: (value){
                  print(value);
                },
              )
              ),
              IconButton(
                onPressed: () async{
                  var place=
                  await LocationService().getPlace(_searchController.text);
                  _goToPlace(place);
                },
                icon: Icon(Icons.search),
              ),
            ],
          ),
          Expanded(
            child:GoogleMap(
            mapType: MapType.hybrid,
            markers: {_kGooglePlexMarker},
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
            },
          ),
          )
        ],
      )
    );
  }
  Future<void> _goToPlace(Map<String,dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(lat,lng),zoom: 12),
    ),
    );
  }
}

