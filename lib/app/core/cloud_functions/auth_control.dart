import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttangkkeusmarket/app/src/modules/login/login_view.dart';

class AuthController extends GetxController {
  //sign up text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  //login text editing controllers
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordContorller = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> createAcoount() async {
    final user = await _auth.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    final firestore = FirebaseFirestore.instance;
    firestore.collection('users').doc(user.user!.uid).set({
      "email": emailController.text,
      "password": passwordController.text,
      "address": addressController.text,
      "PhoneNumber": phoneNumberController.text,
    });
    if (user == null) {
      print('error');
    }
  }

  Future<void> LoginUSER() async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: loginEmailController.text,
          password: loginPasswordContorller.text);
      if (user != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("userID", user.user!.uid);
        print(user.user!.uid);
      } else {
        print('error');
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
      print(e.message);
    }
  }

  Future<void> logoutUser() async {
    await _auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAll(
      const LoginView(),
    );
  }
}
