import 'package:Tower/map/address.dart';
import 'package:flutter/cupertino.dart';

class AppData extends ChangeNotifier {
  Address? pinnedLocationOnMap;

  void updatePickUpLocationAddress (Address pickUpAddress){
    pinnedLocationOnMap= pickUpAddress;
    notifyListeners();
  }
}