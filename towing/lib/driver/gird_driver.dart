import 'package:Tower/Services/refuling.dart';
import 'package:Tower/Services/tow.dart';
import 'package:Tower/services/shipping.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'driver_tow.dart';


class GridDriver extends StatelessWidget {
  Items item1 = Items(
    title: "Tow",
    img: "assets/Logo.png",
  );
  Items item2 = Items(
    title: "Refuling",
    img: "assets/Fuel.png",
  );
  Items item3 = Items(
    title: "Shipping",
    img: "assets/Logo.png",
  );


  Widget tapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        return DriverTow();
        break;

      case 1:
        return Refuling();
        break;

      default:
        return Shipping();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3];
    //var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1,
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: myList.map((data) {
            return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 3,
                    )),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              tapped(context, myList.indexOf(data)),
                        ));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        data.img,
                        height: 60,
                        width: 60,
                      ),
                      /*const SizedBox(
                        height: 8,
                      ),*/
                      Text(
                        data.title,
                        style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ));
          }).toList()),
    );
  }
}

class Items {
  String title;
  String img;
  Items({required this.title, required this.img});
}
