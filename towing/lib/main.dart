import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:towing/loginpage.dart';
import 'routes.dart';
import 'themes.dart';


Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  try{
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyBGdIxPEKbOCHK7V_ylMpU-E3vni-5wqy0',
        appId: '1:545883646552:android:401cb72f0c46b9390ef82d',
        messagingSenderId: '545883646552',
        projectId: 'towingapp-fab00',
        //authDomain: 'https://news-app-a72fd-default-rtdb.asia-southeast1.firebasedatabase.app',
        //databaseURL: 'https://react-native-firebase-testing.firebaseio.com',
        //storageBucket: 'news-app-a72fd.appspot.com',
      ),
    );}catch(e){
    if (kDebugMode) {
      print(e.toString());
    }
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TOWING APP',
      debugShowCheckedModeBanner: false,
      theme: rootTheme(),
      onGenerateRoute: RouteGen.generateRoute,
      home: const SplashPage(),
    );
  }
}


