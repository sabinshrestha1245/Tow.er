import 'package:Tower/pages/googlemap.dart';
import 'package:flutter/material.dart';

class Tow extends StatefulWidget {
  const Tow({Key? key}) : super(key: key);

  @override
  State<Tow> createState() => _TowState();
}

class _TowState extends State<Tow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  //shedule booking
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(12),

                    child: Icon(
                      Icons.calendar_today,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),

              //search bar
              Container(
                decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.all(12),
                //alignment: Alignment.centerLeft,
                child: TextField(
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Set your Location',
                    labelText: 'Set Your Location',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      //borderSide: const BorderSide(width: 0, style: BorderStyle.none)
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.location_pin),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}