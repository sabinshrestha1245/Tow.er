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
        child: Text("About Tow.Er : "
            "\n Branch Head - Kathmandu \n"
            "Diwas Suyal - 9823836514"),
      ),
    );
  }
}