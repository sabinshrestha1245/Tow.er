import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage
> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white60,
        elevation: 0,
        title: const Text(
          "About Us",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),

      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SizedBox(
              child: Container(
                height: 300,
                width: 500,
                decoration: BoxDecoration(
                  //color:  Colors.black,
                  border: Border.all(
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(" The application is based on instant repairing and towing vehicles if the vehicle gets stuck and theproblem is time consuming."
                        "\n Here is a registration system for both clients and service centers andthe services are provided by the company that is registered in the application. "
                        "Once the registrationis done the clients need to choose the services, "
                        "they want Clients could select the variety of servicessuch as vehicle towing and mechanic support, etc.\n"
                        "Diwas Suyal - 9823836514"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}