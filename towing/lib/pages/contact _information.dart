import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactInformation extends StatefulWidget {
  const ContactInformation({Key? key}) : super(key: key);

  @override
  State<ContactInformation> createState() => _ContactInformationState();
}

class _ContactInformationState extends State<ContactInformation> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Contact the following branch : "
            "\n Branch Head - Kathmandu \n"
            "Diwas Suyal - 9823836514"),
      ),
      );
  }
}
