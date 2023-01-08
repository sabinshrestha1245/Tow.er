import 'package:Tower/pages/homepage.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'loginpage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  final storage = const FlutterSecureStorage();
  readfromstorage() async {
    String? value = await storage.read(key: "first");
    if (value == null) {
      //go to registration
      //first false
      await storage.write(key: "first", value: "false");
      Navigator.pushNamed(context, "/Signin");
    } else {
      Navigator.pushNamed(context, "/HomePage",);
      //Homepage
      await storage.write(key: "first", value: "false");
    }
  }

  @override
  void initState() {
    super.initState();

    //readfromstorage();
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomePage();
        }
        return const Signin();
      },
    );
  }
}

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
}