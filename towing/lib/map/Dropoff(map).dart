import 'dart:async';
import 'package:Tow.er/Customer_Services/Cus_tow.dart';
import 'package:Tow.er/Customer_Services/billing.dart';
import 'package:Tow.er/map/Dropoff(map).dart';
import 'package:Tow.er/map/Pickup(map).dart';
import 'package:Tow.er/map/app_data.dart';
import 'package:Tow.er/map/assistant_methods.dart';
import 'package:Tow.er/map/global.dart';
// import 'package:Tower/map/location_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:Tow.er/map/address.dart';


class DropMap extends StatefulWidget {
  @override
  State<DropMap> createState() => MapSampleState();
}

class MapSampleState extends State<DropMap> {
  final Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController? _newGoogleMapController;

  // static const LatLng PickUpPoint= LatLng(27.684451129981866, 85.31695593148471);

  LocationPermission? _locationPermission;
  var geoLocator = Geolocator();
  Position? userCurrentPosition;
  static LatLng? _initialPosition;
  static CameraPosition? _cameraPosition;
  Set<Circle> circlesSet = {};
  LatLng? onCameraMoveEndLatLng;
  bool isPinMarkerVisible = true;
  Uint8List pickUpMarker = Uint8List.fromList([]);

  checkIfLocationPermissionAllowed() async {
    _locationPermission = await Geolocator.requestPermission();
    if (_locationPermission == LocationPermission.denied) {
      _locationPermission = await Geolocator.requestPermission();
    }
  }

  void _getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    userCurrentPosition = position;
    setState(() {
      _initialPosition =
          LatLng(userCurrentPosition!.latitude, userCurrentPosition!.longitude);
      _cameraPosition =
          CameraPosition(target: _initialPosition as LatLng, zoom: 16.0);
      _newGoogleMapController
          ?.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition!));
    });
  }

  Future<LatLng> pickLocationOnMap(CameraPosition _onCameraMovePosition) async {
    LatLng onCameraMoveLatLng = _onCameraMovePosition.target;
    Circle pinCircle = Circle(
        circleId: const CircleId("0"),
        radius: 1,
        zIndex: 1,
        strokeColor: Colors.transparent,
        center: onCameraMoveLatLng);
    circlesSet.add(pinCircle);
    return onCameraMoveLatLng;
  }

  void _getPinnedAddress() async {
    await AssistantMethods.dropOffPositionOnMap(
        onCameraMoveEndLatLng!, context);
  }

  void _getMarker() async {
    pickUpMarker =
        await AssistantMethods.getDropMarker(userDropOffMarker, context);
    setState(() {});
  }

  @override
  void initState() {
    checkIfLocationPermissionAllowed();
    _getUserLocation();
    _getMarker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context);
    String originAddress;
    if (appData.pinnedDropOffLocationOnMap != null) {
      originAddress = appData.pinnedDropOffLocationOnMap!.dropOffPlaceName.toString();
    } else {
      originAddress = "Searching...";
    }

    return Scaffold(
      body: _initialPosition == null
          ? Center(
              child: Text(
                'loading map..',
                style: TextStyle(
                    fontFamily: 'Avenir-Medium',
                    color: Colors.grey[400],
                    fontSize: 20),
              ),
            )
          : Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  GoogleMap(
                    padding: const EdgeInsets.only(bottom: 130),
                    mapType: MapType.normal,
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    zoomControlsEnabled: false,
                    zoomGesturesEnabled: true,
                    circles: circlesSet,
                    initialCameraPosition: _cameraPosition!,

                    onCameraMove: (position) async {
                      if (isPinMarkerVisible) {
                        onCameraMoveEndLatLng =
                            await pickLocationOnMap(position);
                        print(onCameraMoveEndLatLng);
                      }
                    },
                    // pickLat=onCameraMoveEndLatLng.latitude;
                    onCameraIdle: _getPinnedAddress,

                    onMapCreated: (GoogleMapController controller) {
                      _controllerGoogleMap.complete(controller);
                      _newGoogleMapController = controller;
                    },
                  ),
                  Visibility(
                    visible: isPinMarkerVisible,
                    child: Image.memory(
                      pickUpMarker,
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) {
                        return Transform.translate(
                            offset: const Offset(0, -20), child: child);
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: radius, color: Colors.white),
                      height: 166.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 10.0),
                        child: Column(
                          children: [
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(35.0),
                                border: Border.all(
                                    color: Colors.blue,
                                    width: 1.0,
                                    style: BorderStyle.solid),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  const Icon(
                                    Icons.my_location,
                                    color: Colors.blue,
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      originAddress,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 55,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    (context),
                                    MaterialPageRoute(
                                        builder: (context) => PickMap()),
                                    (route) => true);
                              },
                              child: const Text(
                                "Back To Details",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {


                                Navigator.pushAndRemoveUntil(
                                    (context),
                                    MaterialPageRoute(
                                        builder: (context) => Billing()),
                                    (route) => true);
                              },
                              child: const Text(
                                "Continue",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
