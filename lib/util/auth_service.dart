import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:restaurant_pos/screens/login_page.dart';
import 'package:restaurant_pos/screens/main_screen.dart';

class AuthService{
  handleAuthState(){
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot){
        if(snapshot.hasData){
          return MainScreen();
        } else {
          return LoginPage();
        }
      },
    );
  }

  signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn(scopes: <String>["email"]).signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() async {
    final googleSignin = GoogleSignIn();
    await googleSignin.disconnect();
    FirebaseAuth.instance.signOut();
  }
}