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
    return const Scaffold(
      body: Center(
        child: Text(" The application is based on instant repairing and towing vehicles if the vehicle gets stuck and theproblem is time consuming."
            "\n here is a registration system for both clients and service centers andthe services are provided by the company that is registered in the application. "
            "Once the registrationis done the clients need to choose the services, "
            "they want Clients could select the variety of servicessuch as vehicle towing and mechanic support, etc.\n"
            "Diwas Suyal - 9823836514"),
      ),
    );
  }
}