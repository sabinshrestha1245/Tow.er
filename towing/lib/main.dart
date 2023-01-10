import 'package:Tower/map/app_data.dart';
import 'package:Tower/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'routes/routes.dart';



Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  String? errorMessage;
  try{
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyBGdIxPEKbOCHK7V_ylMpU-E3vni-5wqy0',
        appId: '1:545883646552:android:401cb72f0c46b9390ef82d',
        messagingSenderId: '545883646552',
        projectId: 'towingapp-fab00',
      ),
    );}catch(error){
    Fluttertoast.showToast(msg: errorMessage!);
    print(error);
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
          //theme: rootTheme(),
          //onGenerateRoute: RouteGen.generateRoute,
          home: SplashScreen(),
        ),);
  }
}


