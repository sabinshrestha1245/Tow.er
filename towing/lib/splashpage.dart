import 'package:Tower/pages/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  @override
  final storage = const FlutterSecureStorage();
  readfromstorage() async {
    String? value = await storage.read(key: "role");
    if (value == "Customer") {
      await storage.read(key: "role");
      Navigator.pushNamed(context, "/HomePage");
  /*Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const HomePage()),
          (route) => false);*/


      //Homepages
    } else if (value == "Driver") {
      await storage.read(key: "role");
      Navigator.pushNamed(context, "/DriverDashboard");
/*Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const DriverDashboard()),
          (route) => false);*/


      //DriverDashboard
    } else if (value == "Mechanic") {
      await storage.read(key: "role");
      Navigator.pushNamed(context, "/MechanicDashboard");
/*Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const MechanicDashboard()),
          (route) => false);*/


      //MechanicDashboard
    } else {
      Navigator.pushNamed(context, "/Signin");
/*Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => const Signin()),
          (route) => false);*/


    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          readfromstorage();
        }
        return const Signin();
      },
    );
  }
}
