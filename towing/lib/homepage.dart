import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:towing/loginpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: ElevatedButton(
          child: Text("Logout"),
          onPressed: (){
            FirebaseAuth.instance.signOut().then((value) {
              print("Signed Out");
              Navigator.push(context, MaterialPageRoute(builder: (context) => Signin()));

            });
          },
        ),
      ),
    );
  }
}
