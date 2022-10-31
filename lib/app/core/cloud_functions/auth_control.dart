import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttangkkeusmarket/app/core/values/app_color.dart';
import 'package:ttangkkeusmarket/app/data/my_page/my_page_view.dart';
import 'package:ttangkkeusmarket/app/src/modules/login/login_view.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  final FirebaseAuth autentification = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  late Rx<User?> _user;
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

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(autentification.currentUser);
    _user.bindStream(autentification.userChanges());
    ever(_user, _moveToPage);
  }

  _moveToPage(User? user) {
    if (user == null) {
      Get.offAll(() => const LoginView());
    } else {
      Get.offAll(() => const MyPageView());
    }
  }

  Future<void> createAcoount() async {
    try {
      final user = await autentification.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      firestore.collection('users').doc(user.user!.uid).set({
        "email": emailController.text,
        "password": passwordController.text,
        "address": addressController.text,
        "PhoneNumber": phoneNumberController.text,
      });
    } catch (e) {
      Get.snackbar(
        "Error message",
        "User message",
        backgroundColor: Colors.red[600],
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "회원가입에 실패했습니다.",
          style: TextStyle(color: AppColor.white50),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(color: AppColor.white50),
        ),
      );
    }

    Future<void> LoginUSER() async {
      try {
        final user = await autentification.signInWithEmailAndPassword(
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
      await autentification.signOut();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      Get.offAll(() => const LoginView());
    }
  }
}
