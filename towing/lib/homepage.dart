import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:towing/auth.dart';
import 'package:towing/loginpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(),
      body: Container(
        height: size.height,
        width: size.width,
        /*decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),*/
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Image.network(FirebaseAuth.instance.currentUser!.photoURL!),

                    const SizedBox(
                      height: 10,
                    ),
                    Text("${FirebaseAuth.instance.currentUser!.displayName}",

                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("${FirebaseAuth.instance.currentUser!.email}"),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                /*Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: const Icon(
                    Icons.notifications,
                    color: Colors.black,
                  ),
                )*/
              ],
            )
          ],
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            /*UserAccountsDrawerHeader(
              accountName: Text("AppMaking.co",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              accountEmail: Text("sundar@appmaking.co",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://appmaking.co/wp-content/uploads/2021/08/appmaking-logo-colored.png"),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://appmaking.co/wp-content/uploads/2021/08/android-drawer-bg.jpeg",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),*/
            DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                        child:
                          Image.network(FirebaseAuth.instance.currentUser!.photoURL!,
                          height: 20,),
                        ),

                    Text("${FirebaseAuth.instance.currentUser!.displayName}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("${FirebaseAuth.instance.currentUser!.email}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),


                  ],

                )),
            ListTile(
              leading: const Icon(Icons.home,color: Colors.black,),
              title: const Text('Home',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
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
              leading: Icon(Icons.access_time_outlined, color: Colors.black,),
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
              leading: Icon(Icons.settings, color: Colors.black,),
              title: const Text('General Settings',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
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
              leading: Icon(Icons.person_outline, color: Colors.black,),
              title: const Text('Account Settings',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
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
              leading: Icon(Icons.chat_bubble_outline, color: Colors.black,),
              title: const Text('Customer Support',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
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
              leading: Icon(Icons.contact_support_outlined, color: Colors.black,),
              title: const Text('About',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
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
              leading: Icon(Icons.exit_to_app,color: Colors.black,),
              title: const Text('SignOut',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              onTap: () async {
                await Auth().signOut();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const Signin()));
              },
            ),
            const Divider(
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
