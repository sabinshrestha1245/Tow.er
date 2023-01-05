import 'package:Tower/map/address.dart';
import 'package:Tower/map/app_data.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class AssistantMethods{

  static Future<String> pickOriginPositionOnMap(LatLng position, context) async {
    String placeAddress = "";
    String province = "";
    String locality = "";
    String name = "" ;
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.latitude);
    if(placemarks.isNotEmpty){
      province = placemarks[0].country == null? " ": placemarks[0].administrativeArea!;
      locality = placemarks[0].locality == null? " ": placemarks[0].locality!;
      name=placemarks[0].name == null? " ": placemarks[0].name!;
      placeAddress = name + ", " + locality + ", " + province;
    }
    Address userPickUpAddress = Address();
    userPickUpAddress.latitude = position.latitude;
    userPickUpAddress.longitude = position.longitude;
    userPickUpAddress.placeName = placeAddress;
    Provider.of<AppData>(context, listen: false ). updatePickUpLocationAddress(userPickUpAddress);
    return placeAddress;
  }
}