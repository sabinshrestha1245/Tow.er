import 'package:Tow.er/map/address.dart';
import 'package:Tow.er/map/app_data.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class AssistantMethods{

  static Future<Uint8List> getPickMarker(String pickUpMarker, context) async{
    ByteData byteData = await DefaultAssetBundle.of(context).load("assets/PickUpMarker.png");
    return byteData.buffer.asUint8List();
  }
  static Future<Uint8List> getDropMarker(String dropOffMarker, context) async{
    ByteData byteData = await DefaultAssetBundle.of(context).load("assets/DropOffMarker.png");
    return byteData.buffer.asUint8List();
  }

  static Future<String> pickOriginPositionOnMap(LatLng position, context) async {
    String placeAddress = "";
    String province = "";
    String locality = "";
    String name = "" ;
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    if(placemarks.isNotEmpty){
      province = placemarks[0].country == null? " ": placemarks[0].administrativeArea!;
      locality = placemarks[0].locality == null? " ": placemarks[0].locality!;
      name = placemarks[0].name == null? " ": placemarks[0].subLocality!;

      placeAddress = name + ", " + locality + ", " + province;
    }
    Address userPickUpAddress = Address();
    userPickUpAddress.latitude = position.latitude;
    userPickUpAddress.longitude = position.longitude;
    userPickUpAddress.placeName = placeAddress;
    Provider.of<AppData>(context, listen: false ). updatePickUpLocationAddress(userPickUpAddress);
    return placeAddress;
    print(placeAddress);

  }
}