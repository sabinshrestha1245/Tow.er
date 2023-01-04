import 'package:Tower/Services/cleaning.dart';
import 'package:Tower/Services/refuling.dart';
import 'package:Tower/Services/servicing.dart';
import 'package:Tower/Services/store.dart';
import 'package:Tower/Services/tow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Services/repair.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = Items(
    title: "Tow",
    img: "assets/Logo.png",
  );
  Items item2 = Items(
    title: "Servicing",
    img: "assets/Logo.png",
  );
  Items item3 = Items(
    title: "Cleaning",
    img: "assets/Logo.png",
  );
  Items item4 = Items(
    title: "Refuling",
    img: "assets/Fuel.png",
  );
  Items item5 = Items(
    title: "Store",
    img: "assets/Logo.png",
  );
  Items item6 = Items(
    title: "Repair",
    img: "assets/Logo.png",
  );

  /*Widget tapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => Tow()));
        break;

      case 1:

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Servicing()));
        break;

      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Cleaning()));
        break;

      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Refuling()));
        break;
      case 4:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Store()));
        break;

      default:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Repair()));
    }
  }
*/
  Widget tapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        return Tow();
        break;

      case 1:
        return Servicing();
        break;

      case 2:
        return Cleaning();
        break;

      case 3:
        return Refuling();
        break;

      case 4:
        return Store();
        break;

      default:
        return Repair();
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
