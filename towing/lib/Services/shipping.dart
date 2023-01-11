import 'package:Tow.er/map/Pickup(map).dart';
// import 'package:Tower/pages/homepage.dart';
// import 'package:Tower/pages/signuppage.dart';
import 'package:flutter/material.dart';
// import 'package:Tower/authentication/auth.dart';
// import 'package:Tower/model/user_model.dart';
// import 'package:Tower/pages/loginpage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class Shipping extends StatefulWidget {
  const Shipping({Key? key}) : super(key: key);

  @override
  State<Shipping> createState() => _ShipState();
}

class _ShipState extends State<Shipping> {
  // string for displaying the error Message
  String? errorMessage;

  // editing Controller
  final carModelEditingController = new TextEditingController();
  final carPlateNoEditingController = new TextEditingController();
  final dateEditingController = new TextEditingController();
  final remarksEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

    //Car Model field
    final carModelField = TextFormField(
        autofocus: false,
        controller: carModelEditingController,
        keyboardType: TextInputType.name,
        cursorColor: Colors.black,
        style: TextStyle(color: Colors.black.withOpacity(0.9)),
        onSaved: (value) {
          carModelEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Car Model (Eg.-Ford F150)",
          fillColor: const Color.fromRGBO(217, 217, 217, 0.56),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(
                width: 1,
              )),
        ));

    //carPlateNoEditingController field
    final carPlateNoField = TextFormField(
        autofocus: false,
        controller: carPlateNoEditingController,
        keyboardType: TextInputType.name,
        cursorColor: Colors.black,
        style: TextStyle(color: Colors.black.withOpacity(0.9)),
        validator: (value) {
          if (value!.isEmpty) {
            return ("Car Plate No. cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          carPlateNoEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Car Plate No. (Eg.-A BE 1234)",
          fillColor: const Color.fromRGBO(217, 217, 217, 0.56),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(
                width: 1,
              )),
        ));

    DateTime _dateTime = DateTime.now();

    void _showDatePicker() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2050),
      ).then((value) {
        setState(() {
          _dateTime = value!;
        });
      });
    }

    //date Button
    final dateButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(255, 170, 248, 248),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: _showDatePicker,
          child: Text(
            'Date: ' +
                _dateTime.year.toString() +
                "/" +
                _dateTime.month.toString() +
                "/" +
                _dateTime.day.toString(),
            style: TextStyle(fontSize: 16, color: Colors.black45),
          )),
    );

    //show timepicker method

    TimeOfDay _timeOfDay =TimeOfDay.now();
    void _showTimePicker() {
      showTimePicker(context: context, initialTime: TimeOfDay.now(),
      ).then((value){
        setState(() {
          _timeOfDay=value!;
          print(_timeOfDay);
        });
      } );
    }

    //time Button
    final timeButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(255, 170, 248, 248),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: _showTimePicker,
          child: Text(
            'Time: ' +
                _timeOfDay.hour.toString() +
                ":" +
                _timeOfDay.minute.toString(),
            style: TextStyle(fontSize: 16, color: Colors.black45),
          )),
    );

    //remarksEditingController field
    final remarksField = TextFormField(
        autofocus: false,
        controller: remarksEditingController,
        keyboardType: TextInputType.text,
        cursorColor: Colors.black,
        style: TextStyle(color: Colors.black.withOpacity(0.9)),
        onSaved: (value) {
          remarksEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Remarks (Optional)",
          fillColor: const Color.fromRGBO(217, 217, 217, 0.56),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(
                width: 1,
              )),
        ));

    //Continue button
    final continueButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                (context),
                MaterialPageRoute(builder: (context) => PickMap()),
                (route) => false);
          },
          child: const Text(
            "Continue",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0,
        title: const Text(
          "Shipping",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Form(
              child: Column(
                children: <Widget>[
                  SizedBox(
                      height: 115,
                      child: Image.asset(
                        'assets/Logo.png',
                        fit: BoxFit.fitWidth,
                      )),
                  SizedBox(width: 10, height: 20),
                  const Text(
                    "Please Enter The Following",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 45),
                  const Text(
                    "Details",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  dateButton,
                  SizedBox(height: 20),
                  timeButton,
                  SizedBox(height: 20),
                  carModelField,
                  SizedBox(height: 20),
                  carPlateNoField,
                  SizedBox(height: 20),
                  remarksField,
                  SizedBox(height: 20),
                  continueButton,
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
