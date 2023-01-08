import 'package:Tower/map/googlemap.dart';
import 'package:Tower/pages/homepage.dart';
import 'package:Tower/pages/signuppage.dart';
import 'package:flutter/material.dart';

class Tow extends StatefulWidget {
  const Tow({Key? key}) : super(key: key);

  @override
  State<Tow> createState() => _TowState();
}

class _TowState extends State<Tow> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                  height: 800,
              child: MapSample()
              ),

            ],
          ),
        ),
      ),
    );
  }
}
