import 'package:Tow.er/map/address.dart';
import 'package:flutter/cupertino.dart';

class AppData extends ChangeNotifier {
  Address? pinnedPickUpLocationOnMap;
  Address? pinnedDropOffLocationOnMap;

  void updatePickUpLocationAddress(Address pickUpAddress) {
    pinnedPickUpLocationOnMap = pickUpAddress;
    notifyListeners();
  }

  void updateDropoffLocationAddress(Address dropOffAddress) {
    pinnedDropOffLocationOnMap = dropOffAddress;
    notifyListeners();
  }
}
