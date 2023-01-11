import 'package:flutter/material.dart';

import '../map/googlemap(pick+drop).dart';

class Cleaning extends StatefulWidget {
  const Cleaning({Key? key}) : super(key: key);

  @override
  State<Cleaning> createState() => _CleaningState();
}

class _CleaningState extends State<Cleaning> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(height: size.height, child: MapElse()),
          ],
        ),
      ),
    );
  }
}
