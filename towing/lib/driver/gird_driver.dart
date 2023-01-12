import 'package:Tow.er/Customer_Services/Cus_refuling.dart';
import 'package:Tow.er/Customer_Services/Cus_tow.dart';
import 'package:Tow.er/Customer_Services/Cus_shipping.dart';
import 'package:Tow.er/driver/driver_cleaning.dart';
import 'package:Tow.er/driver/driver_refuling.dart';
import 'package:Tow.er/driver/driver_servicing.dart';
import 'package:Tow.er/driver/driver_shipping.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'driver_tow.dart';

class GridDriver extends StatelessWidget {
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
    title: "Refueling",
    img: "assets/Refueling.jpg",
  );

  Widget tapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        return DriverTow();
        break;

      case 1:
        return DriverShipping();
        break;

      case 2:
        return DriverCleaning();
        break;

      case 3:
        return DriverServicing();
        break;

      default:
        return DriverRefuling();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4,item5];
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
                        height: 74,
                        width: 74,
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
