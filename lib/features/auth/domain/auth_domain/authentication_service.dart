import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../../../generated/l10n.dart';
import '../../data/models/user/user.dart';

class FirebaseAuthService {
  static userState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        //print('User is currently signed out!');
      } else {
        //print('User is signed in!\nemial:${user.email}');
      }
    });
  }

  static Future signUp(
      {required String emailAddress, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return UserModel(
          uid: credential.user?.uid ?? "0",
          name: credential.user?.displayName ?? "",
          email: credential.user?.email ?? "",
          imageUrl: credential.user?.photoURL ?? "",
          password: "");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return S.current.passErrorSignUp;
        // //print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return S.current.emailErrorSignUp;
        ////print('The account already exists for that email.');
      } else {
        return S.current.connectionError;
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future signIn(
      {required String emailAddress, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return UserModel(
          uid: credential.user?.uid ?? "0",
          name: credential.user?.displayName ?? "",
          email: credential.user?.email ?? "",
          imageUrl: credential.user?.photoURL ?? "",
        
          password: '');
    } on FirebaseAuthException catch (e) {
      // //print("login exception : ${e.code}");
      if (e.code == "invalid-credential") {
        return S.current.loginError;
      }
      if (e.code == 'user-not-found') {
        return S.current.userNotFound;
      } else if (e.code == 'wrong-password') {
        return S.current.wrongPass;
      } else {
        return S.current.connectionError;
      }
    } catch (e) {
      return e;
    }
  }

  static Future signInWithGoogle() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final user = await auth.signInWithCredential(credential);
      return UserModel(
          uid: user.user?.uid ?? "0",
          name: user.user?.displayName ?? "",
          email: user.user?.email ?? "",
          imageUrl: user.user?.photoURL ?? "",
          phoneNumber: user.user?.phoneNumber ?? "",
          password: '');
    } on PlatformException catch (e) {
      if (e.code == "network_error") {
        throw Exception(S.current.connectionError);
      }

      //return e.toString();
    } catch (error) {
      return error.toString();
    }
  }

  static Future signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();
      if (loginResult.accessToken == null) {
        throw Exception(S.current.connectionError);
      }
      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
      // Once signed in, return the UserCredential
      final user = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      return UserModel(
          uid: user.user?.uid ?? "0",
          name: user.user?.displayName ?? "",
          email: user.user?.email ?? "",
          imageUrl: user.user?.photoURL ?? "",
          phoneNumber: user.user?.phoneNumber ?? "",
          password: '');
    } on FirebaseAuthException catch (e) {
      //print("error from email verfication");
      if (e.code == "invalid-credential") {
        return S.current.loginError;
      }
      if (e.code == 'user-not-found') {
        return S.current.userNotFound;
      } else if (e.code == 'wrong-password') {
        return S.current.wrongPass;
      } else {
        return S.current.connectionError;
      }
      // return e.toString();
    }
  }

  static Future logOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }

  static Future forgotPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-credential") {
        return S.current.loginError;
      }
      if (e.code == 'user-not-found') {
        return S.current.userNotFound;
      } else {
        return S.current.connectionError;
      }
    }
  }

  static Future sendEmailVerfication() async {
    try {
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();
      return true;
    } on FirebaseAuthException catch (e) {
      //print("error from email verfication");
      if (e.code == "invalid-credential") {
        return S.current.loginError;
      }
      if (e.code == 'user-not-found') {
        return S.current.userNotFound;
      } else if (e.code == 'wrong-password') {
        return S.current.wrongPass;
      } else {
        return S.current.connectionError;
      }
      // return e.toString();
    }
  }
}
