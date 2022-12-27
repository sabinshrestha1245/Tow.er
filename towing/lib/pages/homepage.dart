import 'package:Tower/authentication/auth.dart';
import 'package:Tower/pages/grid_dashboard.dart';
import 'package:Tower/pages/loginpage.dart';
import 'package:Tower/tow.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /*SizedBox(
                      height: 50,
                      child:
                          Image.network(FirebaseAuth.instance.currentUser!.photoURL!,
                            ),
                        ),

                    Text("${FirebaseAuth.instance.currentUser!.displayName}",
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
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
          Fluttertoast.showToast(
              msg: "This is Center Short Toast",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }),
        items: [
          BottomNavyBarItem(
            icon: const Icon(Icons.apps),
            title: const Text('Home'),
            activeColor: Colors.red,
          ),
          BottomNavyBarItem(
              icon: const Icon(Icons.people),
              title: const Text('Users'),
              activeColor: Colors.purpleAccent),
          BottomNavyBarItem(
              icon: const Icon(Icons.message),
              title: const Text('Messages'),
              activeColor: Colors.pink),
          BottomNavyBarItem(
              icon: const Icon(Icons.settings),
              title: const Text('Settings'),
              activeColor: Colors.blue),
        ],
      ),
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
             const SizedBox(
              height: 40,
            ),
             GridDashboard()
          ],
        ),
      ),
    );
  }
}

