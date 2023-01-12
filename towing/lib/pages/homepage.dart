import 'dart:async';

import 'package:Tow.er/model/user_model.dart';
import 'package:Tow.er/pages/about_page.dart';
import 'package:Tow.er/pages/contact%20_information.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Tow.er/authentication/auth.dart';
import 'package:Tow.er/pages/grid_dashboard.dart';
import 'package:Tow.er/pages/loginpage.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import '../customer_check_history.dart';
import 'generalsetting.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  late final PageController pageController;
  ScrollController _scrollController = ScrollController();
  int pageNo = 0;

  Timer? carasouelTmer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageNo == 4) {
        pageNo = 0;
      }
      pageController.animateToPage(
        pageNo,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCirc,
      );
      pageNo++;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    carasouelTmer = getTimer();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        showBtmAppBr = false;
        setState(() {});
      } else {
        showBtmAppBr = true;
        setState(() {});
      }
    });
    super.initState();

    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());

      setState(() {});
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  bool showBtmAppBr = true;

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  List<String> images = [
    'assets/Tow_banner.jpg',
    'assets/Repair_banner.jpg',
    'assets/Clraning_banner.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        /* appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.green),
      ),*/
        key: _globalKey,
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  decoration: const BoxDecoration(color: Colors.cyan),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${loggedInUser.firstName} ${loggedInUser.lastName}",
                        style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                      ),
                      Text(
                        "${loggedInUser.email}",
                        style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                      ),
                      /* SizedBox(
                      height: 50,
                      child:
                      Image.network(FirebaseAuth.instance.currentUser!.photoURL!,
                            ),
                        ),*/

                      /*Text("${FirebaseAuth.instance.currentUser!.displayName}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    Text("${FirebaseAuth.instance.currentUser!.email}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),),*/
                    ],
                  )),
              ListTile(
                leading: const Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                title: const Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage())),
                // Update the state of the app
                // ...
                // Then close the drawer
              ),
              const Divider(
                thickness: 2,
              ),
              ListTile(
                leading: const Icon(
                  Icons.access_time_outlined,
                  color: Colors.black,
                ),
                title: const Text(
                  'Check History',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CustomerCheckHistory())),
              ),
              const Divider(
                thickness: 2,
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                title: const Text(
                  'Settings',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingsScreen()));
                },
              ),
              const Divider(
                thickness: 2,
              ),
              ListTile(
                leading: const Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.black,
                ),
                title: const Text(
                  'Customer Support',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Update the state of the app
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContactInformation()));
                  // Then close the drawer
                },
              ),
              const Divider(
                thickness: 2,
              ),
              ListTile(
                leading: const Icon(
                  Icons.contact_support_outlined,
                  color: Colors.black,
                ),
                title: const Text(
                  'About',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutPage()));
                  //Navigator.pop(context);
                },
              ),
              const Divider(
                thickness: 2,
              ),
              ListTile(
                leading: const Icon(
                  Icons.exit_to_app,
                  color: Colors.black,
                ),
                title: const Text(
                  'SignOut',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () async {
                  await Auth().signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Signin()));
                },
              ),
              const Divider(
                thickness: 2,
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (index) {
                      pageNo = index;
                      setState(() {});
                    },
                    itemBuilder: (_, index) {
                      return AnimatedBuilder(
                        animation: pageController,
                        builder: (ctx, child) {
                          return child!;
                        },
                        child: SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    itemCount: images.length,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.circle,
                          size: 12.0,
                          color: pageNo == index
                              ? Colors.indigoAccent
                              : Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ),
                ),

                //greeting
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,

                                fontWeight: FontWeight.w600)),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "${loggedInUser.firstName} ${loggedInUser.lastName}",
                        style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                      ),
                      /* Text(
                        "${loggedInUser.email}",
                        style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                      ),
                      Text(
                        "${loggedInUser.phone}",
                        style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                      ),*/
                      // Text(
                      //   "${loggedInUser.role}",
                      //   style: GoogleFonts.openSans(
                      //       textStyle: const TextStyle(
                      //           color: Colors.black,
                      //           fontSize: 16,
                      //           fontWeight: FontWeight.w600)),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //meue or drawer
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(5),
                      child: IconButton(
                        onPressed: () {
                          _globalKey.currentState?.openDrawer();
                        },
                        icon: const Icon(Icons.menu),
                        color: Colors.black,
                      ),
                    ),
                    //Notification
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.all(5),
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => CustomerCheckHistory()));
                            },
                            icon: const Icon(
                              Icons.notifications,
                              color: Colors.black,
                            ))),
                  ],
                ),
                /*SizedBox(
                  height: 10,
                ),*/

                Text(
                  "Choose A Service",
                  style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                ),
                /* const SizedBox(
                  height: 10,
                ),*/
                GridDashboard()
              ],
            ),
          ),
        ));
  }

  Widget buildImage(String image, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      );
}
