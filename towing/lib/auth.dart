import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final _firebaseAuth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        await _firebaseAuth.signInWithCredential(authCredential);
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
    /*
    //Trigger the authentication flow
    GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: <String>["email"]).signIn();

    //obtain the auth details from the request
    GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    //create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    //Once signed in, returned the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);*/
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }
}
