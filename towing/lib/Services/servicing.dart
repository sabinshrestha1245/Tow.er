import 'package:Tower/map/googlemap.dart';
import 'package:flutter/material.dart';

class Servicing extends StatefulWidget {
  const Servicing({Key? key}) : super(key: key);

  @override
  State<Servicing> createState() => _ServicingState();
}

class _ServicingState extends State<Servicing> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              height: 800,
                child: MapSample()),
          ],
        ),
      ),
    );
  }
}
