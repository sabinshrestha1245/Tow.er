import 'package:Tower/pages/homepage.dart';
import 'package:Tower/pages/reset_password.dart';
import 'package:Tower/reusable_widget/reusable_widget.dart';
import 'package:Tower/pages/signuppage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../authentication/auth.dart';

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
      Navigator.pushNamed(context, "/HomePage");
      //Homepage
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

  final _formKey = GlobalKey<FormState>();

 /* String? errorMessage = '';
  bool isLogin = true;*/

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20,0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 200,
                  child: Image.asset('assets/Logo.png',
                    fit: BoxFit.fitWidth,
                  )
                ),
                const Text("Welcome",
                  style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                const Text("Login to your account",
                  style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                const SizedBox(height: 30,),

                reusableTextField("Enter Email", Icons.mail, false, _emailTextController),
                const SizedBox(height: 20,),
                reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),
                const SizedBox(
                  height: 5,
                ),
                forgetPassword(context),
                const SizedBox(
                  height: 5,
                ),

                firebaseUIButton(context, "LOG IN", () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text)
                      .then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  } ).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                }),
                signUpOption(),
                GestureDetector(
                    onTap: () async {
                      await Auth().signInWithGoogle(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: const Image(width: 100, image: AssetImage('assets/google.png')))
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
        const Text("Don't have account?",
            style: TextStyle(color: Colors.black)),
        GestureDetector(
          onTap: ()  {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUp()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.red),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
}
