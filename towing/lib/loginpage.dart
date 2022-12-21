import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:towing/homepage.dart';
import 'package:towing/reusable_widget/reusable_widget.dart';
import 'package:towing/signuppage.dart';
import 'auth.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState(){
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  final storage = const FlutterSecureStorage();
  readfromstorage() async {
    String? value = await storage.read(key: "first");
    if(value==null){
      //go to registration
      //first false
      await storage.write(key: "first", value: "false");
      Navigator.pushNamed(context, "/Signin");
    } else{
      Navigator.pushNamed(context, "/Dashboard");
      //Dashboard page
      await storage.write(key: "first", value: "false");
    }
  }
  @override
  void initState() {
    super.initState();
    //readfromstorage();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        }
        return const Signin();
      },
    );
  }
}

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState(){
    return SigninState();
  }
}

class SigninState extends State<Signin> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _emailTextController.text,
        password: _passwordTextController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _emailTextController.text,
        password: _passwordTextController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }
  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.2, 20,0),
            child: Column(
              children: <Widget>[
                /*image.("assets/images/Logo.png"),
                const SizedBox(
                  height: 30,
                ),*/
                /*logoWidget('assets/Logo.png'),
                const SizedBox(
                  height: 30,
                ),*/

                Image.asset('assets/Logo.png'),

                reuseableTextField("Enter UserName", Icons.person_outline, false, _emailTextController),
                const SizedBox(height: 20,),
                reuseableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, true, () {
                  FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text,
                      password: _passwordTextController.text).then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  } ).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                }),
                signUpOption()
              ],
            ),
          ),
        ),


      ),
    );
  }

  Row signUpOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?", style: TextStyle(color: Colors.black)),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }



}
