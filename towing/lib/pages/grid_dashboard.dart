import 'package:Tow.er/Services/cleaning.dart';
import 'package:Tow.er/Services/refuling.dart';
import 'package:Tow.er/Services/servicing.dart';
import 'package:Tow.er/Services/tow.dart';
import 'package:Tow.er/services/shipping.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Services/repairing.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = Items(
    title: "Tow",
    img: "assets/Tow.jpg",
  );
  Items item2 = Items(
    title: "Shipping",
    img: "assets/Shipping.jpg",
  );
  Items item3 = Items(
    title: "Cleaning",
    img: "assets/Cleaning.jpg",
  );
  Items item4 = Items(
    title: "Servicing",
    img: "assets/Servicing.jpg",
  );
  Items item5 = Items(
    title: "Refuling",
    img: "assets/Refueling.jpg",
  );
  Items item6 = Items(
    title: "Repairing",
    img: "assets/Repair.jpg",
  );

  Widget tapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        return Tow();
        break;

      case 1:
        return Shipping();
        break;

      case 2:
        return Cleaning();
        break;

      case 3:
        return Servicing();
        break;

      case 4:
        return Refuling();
        break;

      default:
        return Repairing();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    //var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 0.9,
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          crossAxisCount: 3,
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
