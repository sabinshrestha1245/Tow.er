import 'package:Tow.er/map/address.dart';
import 'package:flutter/material.dart';
import 'package:Tow.er/pages/homepage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:Tow.er/map/assistant_methods.dart';

class Billing extends StatefulWidget {
  const Billing({Key? key}) : super(key: key);

  @override
  State<Billing> createState() => _BillingState();
}

// void calculateDistance() {
//   double distanceInMeters = Geolocator.distanceBetween(AssistantMethods().pickAddLong, pickAddLat, dropAddLat, dropAddLong);
//   print(distanceInMeters);
// }

class _BillingState extends State<Billing> {
  double distanceInMeters = Geolocator.distanceBetween(
      Address().pickUpLatitude!,
      Address().pickUpLongitude!,
      Address().dropOffLatitude!,
      Address().dropOffLongitude!);

  @override
  Widget build(BuildContext context) {
    final confirmButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                (context),
                MaterialPageRoute(builder: (context) => HomePage()),
                (route) => true);
          },
          child: const Text(
            "Confirm",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: [
                Text('Name: '),
                Text('Phone Number: '),
                Text('Pick up location: '),
                Text('Drop off location: '),
                Text('Vechile model: '),
                Text('Vehicle Number Plate: '),
                Text('Remarks: '),
                Text('Date: '),
                Text('Time: '),
                Text('distance: '+ distanceInMeters.toString()),
                confirmButton,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
