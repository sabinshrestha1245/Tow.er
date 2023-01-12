import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model/user_model.dart';

class CustomerDetails extends StatefulWidget {
  const CustomerDetails({Key? key}) : super(key: key);

  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
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
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.white60,
          elevation: 0,
          title: const Text(
            "User Details",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SizedBox(
                  child: Container(
                    height: 400,
                    width: 500,
                    decoration: BoxDecoration(
                      //color:  Colors.black,
                      border: Border.all(
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Name: ${loggedInUser.firstName} ${loggedInUser.lastName}",
                          style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Email: ${loggedInUser.email}",
                          style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Phone Number: ${loggedInUser.phone}",
                          style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )

        )
    );
  }
}