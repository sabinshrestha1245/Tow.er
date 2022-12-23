import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:towing/homepage.dart';
import 'package:towing/reusable_widget/reusable_widget.dart';



class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text("Sign Up",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.black),),),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.red,

        /*color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),*/
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reuseableTextField(
                    "Enter UserName", Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reuseableTextField(
                    "Enter Email Id", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(height: 20,),
                reuseableTextField(
                    "Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, false, () {
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text)
                  .then((value) {
                    print("Created New Account");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  }).onError((error, stackTrace){
                    print("Error ${error.toString()}");
                  });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
