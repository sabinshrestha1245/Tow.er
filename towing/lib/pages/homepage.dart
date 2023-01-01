import 'package:Tower/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Tower/authentication/auth.dart';
import 'package:Tower/pages/grid_dashboard.dart';
import 'package:Tower/pages/loginpage.dart';
import 'package:Tower/pages/googlemap.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
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

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

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
                  decoration: const BoxDecoration(color: Colors.yellow),
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
                      /*SizedBox(
                      height: 50,
                      child:*/
                      /*Image.network(FirebaseAuth.instance.currentUser!.photoURL!,
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
                    MaterialPageRoute(builder: (context) => MapSample())),
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
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
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
                  'General Settings',
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
                  Navigator.pop(context);
                },
              ),
              const Divider(
                thickness: 2,
              ),
              ListTile(
                leading: const Icon(
                  Icons.person_outline,
                  color: Colors.black,
                ),
                title: const Text(
                  'Account Settings',
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
                  Navigator.pop(context);
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
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
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
                  Navigator.pop(context);
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
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //meue or drawer
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.yellowAccent,
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
                            color: Colors.yellowAccent,
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.all(5),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications,
                              color: Colors.black,
                            ))),
                  ],
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
                          fontSize: 16,
                          // fontWeight: FontWeight.w600
                        )),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Choose A service",
                  style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
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
}
