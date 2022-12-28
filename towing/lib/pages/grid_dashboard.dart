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

  // void tapped(int index) {
  //   index = 0;
  //   switch (index) {
  //     case 1:
  //       Navigator.push(context, MaterialPageRoute(builder: (context) => Tow()));
  //       break;
  //
  //     case 2:
  //       print('Monday');
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => Servicing()));
  //       break;
  //
  //     case 3:
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => Cleaning()));
  //       break;
  //
  //     case 4:
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => Refuling()));
  //       break;
  //     case 5:
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => Store()));
  //       break;
  //
  //     default:
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => Repair()));
  //   }
  //}

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
                decoration: BoxDecoration(
                    color: Color(color),
                    borderRadius: BorderRadius.circular(10)),
                /*Center(child: Text("Choose a services")),*/
                child: InkWell(
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Tow(),));
                    },
                    /*GestureDetector(
                  // onTap: () => tapped(index),*/
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        data.img,
                        width: 42,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        data.title,
                        style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                      ),
                      const SizedBox(
                        height: 8,
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
