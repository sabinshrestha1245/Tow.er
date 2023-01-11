import 'package:flutter/material.dart';

class DriverTow extends StatefulWidget {
  const DriverTow({Key? key}) : super(key: key);

  @override
  State<DriverTow> createState() => _DriverTowState();
}

class _DriverTowState extends State<DriverTow> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Available"),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height,
                          width: size.width,
                          child: ListView.builder(
                              itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                       Row(
                                         children: [
                                           Column(
                                            children: const [
                                              Text(
                                                "Thankot - kupondol",
                                              ),
                                              Text(
                                                "A DE 1234",
                                              ),
                                            ],
                                           ),
                                           SizedBox(width: 180,),
                                           Text(
                                             'Rs. 5000',
                                           ),
                                         ],
                                       )

                                        //add from database],
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
