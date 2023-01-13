import 'package:Tow.er/map/address.dart';
import 'package:Tow.er/map/app_data.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class AssistantMethods {
  static Future<Uint8List> getPickMarker(String pickUpMarker, context) async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load("assets/PickUpMarker.png");
    return byteData.buffer.asUint8List();
  }

  static Future<Uint8List> getDropMarker(String dropOffMarker, context) async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load("assets/DropOffMarker.png");
    return byteData.buffer.asUint8List();
  }

  static Future<String> pickUpPositionOnMap(
      LatLng pickUpPosition, context) async {
    String pickUpPlaceAddress = "";
    String pickUpProvince = "";
    String pickUpLocality = "";
    String pickUpName = "";
    List<Placemark> placemarks = await placemarkFromCoordinates(
        pickUpPosition.latitude, pickUpPosition.longitude);
    if (placemarks.isNotEmpty) {
      pickUpProvince = placemarks[0].country == null
          ? " "
          : placemarks[0].administrativeArea!;
      pickUpLocality =
          placemarks[0].locality == null ? " " : placemarks[0].locality!;
      pickUpName =
          placemarks[0].name == null ? " " : placemarks[0].subLocality!;

      pickUpPlaceAddress =
          pickUpName + ", " + pickUpLocality + ", " + pickUpProvince;
    }
    Address userPickUpAddress = Address();
    userPickUpAddress.pickUpLatitude = pickUpPosition.latitude;
    userPickUpAddress.pickUpLongitude = pickUpPosition.longitude;
    userPickUpAddress.pickUpPlaceName = pickUpPlaceAddress;
    Provider.of<AppData>(context, listen: false)
        .updatePickUpLocationAddress(userPickUpAddress);

    return pickUpPlaceAddress;
    print(pickUpPlaceAddress);
  }

  static Future<String> dropOffPositionOnMap(
      LatLng dropOffPosition, context) async {
    String dropOffPlaceAddress = "";
    String dropOffProvince = "";
    String dropOffLocality = "";
    String dropOffName = "";
    List<Placemark> placemarks = await placemarkFromCoordinates(
        dropOffPosition.latitude, dropOffPosition.longitude);
    if (placemarks.isNotEmpty) {
      dropOffProvince = placemarks[0].country == null
          ? " "
          : placemarks[0].administrativeArea!;
      dropOffLocality =
          placemarks[0].locality == null ? " " : placemarks[0].locality!;
      dropOffName =
          placemarks[0].name == null ? " " : placemarks[0].subLocality!;

      dropOffPlaceAddress =
          dropOffName + ", " + dropOffLocality + ", " + dropOffProvince;
    }
    Address userDropOffAddress = Address();
    userDropOffAddress.dropOffLatitude = dropOffPosition.latitude;
    userDropOffAddress.dropOffLongitude = dropOffPosition.longitude;
    userDropOffAddress.dropOffPlaceName = dropOffPlaceAddress;
    Provider.of<AppData>(context, listen: false)
        .updatePickUpLocationAddress(userDropOffAddress);

    return dropOffPlaceAddress;
    // print(dropOffPlaceAddress);
  }
}
