import 'package:Tow.er/map/Pickup(map).dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:Tower/pages/homepage.dart';
// import 'package:Tower/pages/signuppage.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';
import '../request_tow_order.dart';
// import 'package:Tower/authentication/auth.dart';
// import 'package:Tower/model/user_model.dart';
// import 'package:Tower/pages/loginpage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class Tow extends StatefulWidget {
  const Tow({Key? key}) : super(key: key);

  @override
  State<Tow> createState() => _TowState();
}

class _TowState extends State<Tow> {

  final _firebaseAuth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();


  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());

      setState(() {});
    });
  }
  // string for displaying the error Message
  String? errorMessage;

  // editing Controller
  final carModel = new TextEditingController();
  final carPlateNo = new TextEditingController();
  final remarks = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

    //Car Model field
    final carModelField = TextFormField(
        autofocus: false,
        controller: carModel,
        keyboardType: TextInputType.name,
        cursorColor: Colors.black,
        style: TextStyle(color: Colors.black.withOpacity(0.9)),
        validator: (value) {
          RegExp regex = new RegExp(r'^.{,}$');
          if (value!.isEmpty) {
            return ("Car model cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Min. 3 Character");
          }
          return null;
        },
        onSaved: (value) {
          carModel.text = value!;
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

    //carPlateNo field
    final carPlateNoField = TextFormField(
        autofocus: false,
        controller: carPlateNo,
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
          carPlateNo.text = value!;
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

    //remarks field
    final remarksField = TextFormField(
        autofocus: false,
        controller: remarks,
        keyboardType: TextInputType.text,
        cursorColor: Colors.black,
        style: TextStyle(color: Colors.black.withOpacity(0.9)),
        onSaved: (value) {
          remarks.text = value!;
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
                (route) => true);
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
          "Towing",
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

  postRequestTowOrderToFirestore() async {
    // calling our firestore
    // calling our user model
    // sending these values

    var firebaseFirestore = await FirebaseFirestore.instance.collection('towDetail');
    User? user = _firebaseAuth.currentUser;
    //await firebaseFirestore

    RequestTowOrder requestTowOrder = RequestTowOrder();

    // writing all the values
    /*requestTowOrder.uid = user?.uid;
    requestTowOrder.firstName = user?.firstName;
    requestTowOrder.lastName = user?.lastName;
    requestTowOrder.phone = user?.phoneNumber;
    requestTowOrder.pickUplocation = 'thankot';
    requestTowOrder.dropOfflocation = 'pcps, kupindol';
    requestTowOrder.carModel = carModel.text;
    requestTowOrder.carPlateNo = carPlateNo.text;
    requestTowOrder.remarks = remarks.text;
    requestTowOrder.date = '2023-01-03';
    requestTowOrder.time = '12: 30';
*/


    /*await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => Signin()), (route) => false);*/
  }
}
