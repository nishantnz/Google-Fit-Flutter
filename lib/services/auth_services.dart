import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //Google Sign In

  signInWithGoogle() async {
    //begin interactive sihn in process

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    //obtain auth details from the request

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    //create a new credential for user
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    //finally lets sign in the user
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
