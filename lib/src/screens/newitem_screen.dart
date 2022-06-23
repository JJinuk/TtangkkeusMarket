import 'package:flutter/material.dart';

class NewitemTab extends StatelessWidget {
  const NewitemTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.green,
        child: const Center(
          child: Text(
            "NEWITEM TAB",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
