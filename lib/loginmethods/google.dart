

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:waterapp/homepage/homepage.dart';
import 'package:waterapp/login/login.dart';
import 'package:waterapp/routes/routes.dart';

class AuthService {
  // ignore: non_constant_identifier_names
  AuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return homepage();
        } else {
          return loginpage();
        }
      },
    );
  }

 signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn(scopes: <String>["email"]).signIn();
  
  if (googleUser != null) {
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    
    return await FirebaseAuth.instance.signInWithCredential(credential);
  } else {
    throw Exception('Failed to sign in with Google.');
  }
}


  signOut() {
    FirebaseAuth.instance.signOut();
  }
}