import 'package:flutter/material.dart';

class DiscountItemView extends StatelessWidget {
  const DiscountItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.blue,
        child: const Center(
          child: Text(
            "DISCOUNTITEM TAB",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
