import 'package:Tow.er/splashpage.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

import 'loginpage.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/Logo.png'),
      title: const Text(
        "Welcome to Tow-Er",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      showLoader: true,
      loadingText: const Text("Loading..."),
      navigator: const SplashPage(),
      durationInSeconds: 1,
    );
  }
  /*Navigator() {

    FirebaseFirestore.instance.collection("users").where("role", isEqualTo: "Customer")
        .get().then((value) =>Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage())) );
    // Driver Dashboard
    FirebaseFirestore.instance.collection("users").where("role", isEqualTo: "Driver")
        .get().then((value) =>Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => DriverDashboard())) );
    // Mechanic Dashboard
    FirebaseFirestore.instance.collection("users").where("role", isEqualTo: "Mechanic")
        .get().then((value) =>Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => MechanicDashboard())) );

  }*/
}

