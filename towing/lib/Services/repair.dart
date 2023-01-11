import 'package:Tower/map/googlemap(pick+drop).dart';
// import 'package:Tower/pages/homepage.dart';
// import 'package:Tower/pages/signuppage.dart';
import 'package:flutter/material.dart';
// import 'package:Tower/authentication/auth.dart';
// import 'package:Tower/model/user_model.dart';
// import 'package:Tower/pages/loginpage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class Repair extends StatefulWidget {
  const Repair({Key? key}) : super(key: key);

  @override
  State<Repair> createState() => _RepairState();
}

class _RepairState extends State<Repair> {
  // string for displaying the error Message
  String? errorMessage;

  // editing Controller

  final litreEditingController = new TextEditingController();
  final priceEditingController = new TextEditingController();

  String dropdownvalue = 'Petrol';
  var items = [
    "Petrol",
    "Diesel",
    // "Electric",
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final typeOfFuel = SizedBox(
      // width: size.width,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 0, 15),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(
                width: 1,
              )),
        ),
        value: dropdownvalue,
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownvalue = newValue!;
          });
        },
      ),
    );

    //litreEditingController field
    final litreField = TextFormField(
        autofocus: false,
        controller: litreEditingController,
        keyboardType: TextInputType.name,
        cursorColor: Colors.black,
        style: TextStyle(color: Colors.black.withOpacity(0.9)),
        validator: (value) {
          if (value!.isEmpty) {
            return ("Field cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          litreEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Litre",
          fillColor: const Color.fromRGBO(217, 217, 217, 0.56),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(
                width: 1,
              )),
        ));

    //priceEditingController field
    final priceField = TextFormField(
        autofocus: false,
        controller: priceEditingController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.black,
        style: TextStyle(color: Colors.black.withOpacity(0.9)),
        onSaved: (value) {
          priceEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Price ",
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
                MaterialPageRoute(builder: (context) => MapElse()),
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
          "Repair",
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
                  typeOfFuel,
                  SizedBox(height: 20),
                  litreField,
                  SizedBox(height: 20),
                  priceField,
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
