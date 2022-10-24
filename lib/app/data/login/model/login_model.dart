import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  String email = "";
  String password = "";
  String name = "";
  String phoneNumber = "";
  String address = "";

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }
}
