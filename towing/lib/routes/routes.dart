import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pages/homepage.dart';
import '../pages/loginpage.dart';


class RouteGen{
  static Route<dynamic> generateRoute(RouteSettings setting){
    switch(setting.name){
      case '/':
        return CupertinoPageRoute(builder: (_)=>const SplashPage());
      case '/Signin':
        return CupertinoPageRoute(builder: (_)=>const Signin());
      case '/HomePage':
        return CupertinoPageRoute(builder: (_)=> HomePage());
      //case '/NewsDetail':
        //return CupertinoPageRoute(builder: (_)=> const NewsDetail());
      default:
        return _errorRoute();
    }

  }
  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text(
              "Error Page"
          ),
        ),
      );
    });
  }
}