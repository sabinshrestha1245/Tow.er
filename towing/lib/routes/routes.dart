import 'package:Tow.er/pages/splashpage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../driver/driver_dashboard.dart';
import '../mechanic/mechanic_dashboard.dart';
import '../pages/homepage.dart';
import '../pages/loginpage.dart';

class RouteGen {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => SplashPage());
      case '/Signin':
        return CupertinoPageRoute(builder: (_) => const Signin());
      case '/HomePage':
        return CupertinoPageRoute(builder: (_) => const HomePage());
      case '/DriverDashboard':
        return CupertinoPageRoute(builder: (_) => const DriverDashboard());
      case '/MechanicDashboard':
        return CupertinoPageRoute(builder: (_) => const MechanicDashboard());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text("Error Page"),
        ),
      );
    });
  }
}
