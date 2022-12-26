import 'package:Tower/pages/homepage.dart';
import 'package:Tower/reusable_widget/reusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


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
      appBar: AppBar(backgroundColor: Colors.blue,
      elevation: 0,
      title: const Text("Sign Up",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.black),),),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 200,
                    child: Image.asset('assets/Logo.png',
                      fit: BoxFit.fitWidth,
                    )
                ),
                const Text("Register",
                  style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                const Text("Create a new account",
                  style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                    "Enter UserName", Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                    "Enter Email Id", Icons.mail, false,
                    _emailTextController),
                const SizedBox(height: 20,),
                reusableTextField(
                    "Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                    "Confirm Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Sign Up", () {
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
