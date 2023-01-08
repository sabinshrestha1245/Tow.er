import 'package:Tower/map/app_data.dart';
import 'package:Tower/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes/routes.dart';
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
      ),
    );}catch(e){
    /*if (kDebugMode) {
      print(e.toString());
    }*/
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=> AppData(),
        child: MaterialApp(
          title: 'TOW-ER',
          debugShowCheckedModeBanner: false,
          theme: rootTheme(),
          onGenerateRoute: RouteGen.generateRoute,
          home: SplashScreen(),
        ),);
  }
}


