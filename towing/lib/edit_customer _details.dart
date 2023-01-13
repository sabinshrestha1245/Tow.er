import 'package:Tow.er/pages/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model/user_model.dart';

class EditCustomerDetails extends StatefulWidget {
  const EditCustomerDetails({Key? key}) : super(key: key);

  @override
  State<EditCustomerDetails> createState() => _EditCustomerDetailsState();
}

class _EditCustomerDetailsState extends State<EditCustomerDetails> {
  bool isObscurePassword = true;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  String? firstName = '';
  String? lastName = '';
  String? email = '';
  String? password = '';
  String? phone = '';
  String? userFirstNameInput = '';
  String? userLastNameInput = '';
  String? userEmailInput = '';
  String? userPasswordInput = '';
  String? userPhoneInput = '';


  Future _getDataFromDatabase() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          firstName = snapshot.data()!['firstName'];
          lastName = snapshot.data()!['lastName'];
          email = snapshot.data()!['email'];
          password = snapshot.data()!['password'];
          phone = snapshot.data()!['phone'];
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _getDataFromDatabase();

    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());

      setState(() {});
    });
  }

  Future _updateUserFirstName() async {
    await FirebaseFirestore.instance.collection('users').doc(user!.uid).update({
      "firstName": userFirstNameInput,
    });
  }
  Future _updateUserLastName() async {
    await FirebaseFirestore.instance.collection('users').doc(user!.uid).update({
      "lastName": userLastNameInput,
    });
  }
  Future _updateUserEmail() async {
    await FirebaseFirestore.instance.collection('users').doc(user!.uid).update({
      "email": userEmailInput,
    });
  }
  Future _updateUserPassword() async {
    await FirebaseFirestore.instance.collection('users').doc(user!.uid).update({
      "password": userPasswordInput,
    });
  }
  Future _updateUserPhone() async {
    await FirebaseFirestore.instance.collection('users').doc(user!.uid).update({
      "phone": userPhoneInput,
    });
  }

  _displayFirstNameTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Update Your First Name Here'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  userFirstNameInput = value;
                });
              },
              decoration: InputDecoration(hintText: "Type Here"),
            ),
            actions: [
              ElevatedButton(
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
              ElevatedButton(
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  _updateUserFirstName();
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                ),
              ),
            ],
          );
        });
  }
  _displayLastNameTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Update Your Last Name Here'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  userLastNameInput = value;
                });
              },
              decoration: InputDecoration(hintText: "Type Here"),
            ),
            actions: [
              ElevatedButton(
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
              ElevatedButton(
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  _updateUserLastName();
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                ),
              ),
            ],
          );
        });
  }
  _displayEmailTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Update Your Email Here'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  userEmailInput = value;
                });
              },
              decoration: InputDecoration(hintText: "Type Here"),
            ),
            actions: [
              ElevatedButton(
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
              ElevatedButton(
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  _updateUserEmail();
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                ),
              ),
            ],
          );
        });
  }
  _displayPasswordTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Update Your Password Here'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  userPasswordInput = value;
                });
              },
              decoration: InputDecoration(hintText: "Type Here"),
            ),
            actions: [
              ElevatedButton(
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
              ElevatedButton(
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  _updateUserPassword();
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                ),
              ),
            ],
          );
        });
  }
  _displayPhoneTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Update Your Phone Here'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  userPhoneInput = value;
                });
              },
              decoration: InputDecoration(hintText: "Type Here"),
            ),
            actions: [
              ElevatedButton(
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
              ElevatedButton(
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  _updateUserPhone();
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white60,
        elevation: 0,
        title: const Text(
          "Edit User Details",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(width: 4, color: Colors.red),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1))
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://cdn0.iconfinder.com/data/icons/user-pictures/100/unknown_1-2-512.png'),
                            )),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 4, color: Colors.white),
                              color: Colors.blue),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'First Name: ' + firstName!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      _displayFirstNameTextInputDialog(context);
                    },
                    icon: Icon(Icons.edit)),
                Text(
                  'Last Name: ' + lastName!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                IconButton(onPressed: () {
                  _displayLastNameTextInputDialog(context);
                }, icon: Icon(Icons.edit)),
                Text(
                  'Email: ' + email!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                IconButton(onPressed: () {
                  _displayEmailTextInputDialog(context);
                }, icon: Icon(Icons.edit)),
                Text(
                  'Password: ' + password!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                IconButton(onPressed: () {
                  _displayPasswordTextInputDialog(context);
                }, icon: Icon(Icons.edit)),
                Text(
                  'Phone: ' + phone!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                IconButton(onPressed: () {
                  _displayPhoneTextInputDialog(context);
                }, icon: Icon(Icons.edit)),
                /*buildTextField("First Name", "${loggedInUser.firstName}", false),
                buildTextField("Second Name", "${loggedInUser.lastName}", false),
                buildTextField("Email", "${loggedInUser.email}", false),
                buildTextField("Password", "${loggedInUser.password}", true),
                buildTextField("Phone Number", "${loggedInUser.phone}", false),*/
                SizedBox(
                  height: 30,
                ),
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'CANCEL',
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.black),
                      ),
                      style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'SAVE',
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    )
                  ],
                )*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                  onPressed: () {
                    setState(() {
                      isObscurePassword = !isObscurePassword;
                    });
                  },
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
