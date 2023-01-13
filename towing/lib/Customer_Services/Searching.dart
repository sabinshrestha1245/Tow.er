import 'package:Tow.er/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}


class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 250,width: 550),
          Lottie.network('https://assets2.lottiefiles.com/private_files/lf30_fpwgnfzv.json'),
          SizedBox(height: 30,width: 550),
          Text('Searching ...',
            style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(height: 200,width: 550),
          TextButton(
            onPressed: () {


              Navigator.pushAndRemoveUntil(
                  (context),
                  MaterialPageRoute(
                      builder: (context) => HomePage()),
                      (route) => false);
            },
            child: const Text(
              "Back to Homescreen",
              style: TextStyle(
                fontSize: 16,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

        ],
      )
    );
  }
}
