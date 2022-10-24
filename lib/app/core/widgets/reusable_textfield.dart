import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  ReusableTextField({
    Key? key,
    this.onTap,
    this.controller,
    this.labelText,
    this.hintText,
    this.suffixIcon,
    this.validator,
    this.onSaved,
    this.obscureText,

  }) : super(key: key);
  VoidCallback? onTap;
  TextEditingController? controller;
  String? labelText;
  String? hintText;
  Icon? suffixIcon;
  String? Function(String?)? validator;
  String? Function(String?)? onSaved;
  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onSaved: onSaved,
      onTap: onTap,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFA2A7B9),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(
            5.0,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
        ),
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
