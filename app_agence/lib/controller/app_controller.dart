import 'dart:convert';
import 'package:app_agence/model/product_data_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AppController extends GetxController {
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login(
      permissions: ['public_profile', 'email', 'pages_manage_metadata'],
    );

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken?.token ?? '');

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<List<ProductDataModel>> readJsonData() async {
    //time data return
    await Future.delayed(
      const Duration(seconds: 3),
    );
    //read json file
    final jsondata = await rootBundle.loadString('assets/sample.json');
    //decode json data as list
    final list = json.decode(jsondata) as List<dynamic>;

    //map json and initialize using DataModel
    return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }
}
