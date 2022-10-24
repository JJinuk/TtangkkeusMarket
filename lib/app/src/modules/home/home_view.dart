import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ttangkkeusmarket/app/core/widgets/custom_appbar.dart';
import 'package:ttangkkeusmarket/app/core/widgets/custom_tabbar.dart';
import 'package:ttangkkeusmarket/app/src/modules/cart/cart_screen.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: "땅끗마켓",
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartView()))
            },
            icon: const Icon(
              LineIcons.shoppingCart,
              size: 32.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: const CustomTabBar(),
    );
  }
}
