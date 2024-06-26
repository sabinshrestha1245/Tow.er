import 'package:Tow.er/mechanic/mechanic_dashboard.dart';
import 'package:Tow.er/pages/homepage.dart';
import 'package:Tow.er/pages/reset_password.dart';
import 'package:Tow.er/pages/signuppage.dart';
import 'package:Tow.er/pages/phone_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../authentication/auth.dart';
import '../driver/driver_dashboard.dart';
import '../model/user_model.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() {
    return SigninState();
  }
}

class SigninState extends State<Signin> {
  //form key
  final _formKey = GlobalKey<FormState>();

  String? errorMessage;

  // editing controller
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  //firebase
  final _firebaseAuth = FirebaseAuth.instance;
  late final currentUser = FirebaseAuth.instance.currentUser;



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final emailField = TextFormField(
        autofocus: false,
        controller: _emailTextController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.black,
        style: TextStyle(color: Colors.black.withOpacity(0.9)),
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          _emailTextController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.mail,
            color: Colors.black,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          fillColor: const Color.fromRGBO(217, 217, 217, 0.56),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(
                width: 1,
              )),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: _passwordTextController,
        obscureText: true,
        cursorColor: Colors.black,
        style: TextStyle(color: Colors.black.withOpacity(0.9)),
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
          return null;
        },
        onSaved: (value) {
          _passwordTextController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.vpn_key,
            color: Colors.black,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(
                width: 1, /*style: BorderStyle.*/
              )),
        ));

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () async {
            User? user = await signIn(_emailTextController.text, _passwordTextController.text);
              route(user);

          },
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                        height: 200,
                        child: Image.asset(
                          'assets/Logo.png',
                          fit: BoxFit.fitWidth,
                        )),
                    const Text(
                      "Welcome",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Login to your account",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    emailField,
                    const SizedBox(
                      height: 20,
                    ),
                    passwordField,
                    const SizedBox(
                      height: 5,
                    ),
                    forgetPassword(context),
                    const SizedBox(
                      height: 5,
                    ),
                    loginButton,
                    const SizedBox(
                      height: 10,
                    ),
                    signUpOption(),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      child: Icon(Icons.phone),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PhoneScreen()));
                      },
                    ),
                    GestureDetector(
                        onTap: () async {
                          await Auth().signInWithGoogle(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: const Image(
                            width: 100, image: AssetImage('assets/google.png')))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  final storage = const FlutterSecureStorage();
   route(User? user) async {
     FirebaseFirestore.instance
         .collection('users')
         .doc(user!.uid)
         .get()
         .then((DocumentSnapshot documentSnapshot) {
       if (documentSnapshot.exists) {
         var data = documentSnapshot.data();
         UserModel model = UserModel.fromMap(data);
         if(model.role == "Customer"){
            storage.write(key: "role",value: "Customer");
           Navigator.of(context).pushReplacement(
                   MaterialPageRoute(builder: (context) => HomePage()));
         }
         else if(model.role == "Mechanic"){
           storage.write(key: "role",value: "Mechanic");
           Navigator.of(context).pushReplacement(
                   MaterialPageRoute(builder: (context) => MechanicDashboard()));
         }
         else{
           storage.write(key: "role",value: "Driver");
           Navigator.of(context).pushReplacement(
               MaterialPageRoute(builder: (context) => DriverDashboard()));
         }

       }
     });



  }
  Future<User?> signIn(String email, String password) async {


    if (_formKey.currentState!.validate()) {
       try {
        var user =  await _firebaseAuth
            .signInWithEmailAndPassword(email: email, password: password);
        User signinuser = user.user!;
        return signinuser;
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
        return null;

      }
    }
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.black)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUp()));
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
