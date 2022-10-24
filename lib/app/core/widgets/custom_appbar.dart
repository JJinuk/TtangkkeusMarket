import 'package:flutter/material.dart';
import 'package:ttangkkeusmarket/app/core/values/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final dynamic title;
  final TextStyle titleTextStyle;
  final bool centerTitle;
  final List<Widget>? actions;
  final Widget? leading;
  final Color backgorundColor;
  final double elevation;

  const CustomAppBar({
    Key? key,
    this.title = '',
    this.titleTextStyle =
        const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
    this.centerTitle = true,
    this.actions,
    this.leading,
    this.backgorundColor = AppColor.tranparent,
    this.elevation = 0.0,
  }) : super(key: key);

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title:
          title.runtimeType == String ? Text(title as String) : title as Widget,
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        fontFamily: 'NotoSans',
        color: Colors.black,
      ),
      centerTitle: centerTitle,
      backgroundColor: backgorundColor,
      elevation: elevation,
      actions: actions,

      // backgroundColor: Colors.transparent,
      // elevation: 0.0,
      // actions: [
      //   IconButton(
      //     onPressed: () => {
      //       Navigator.push(
      //           context, MaterialPageRoute(builder: (context) => CartView()))
      //       // do something
      //     },
      //     icon: const Icon(
      //       LineIcons.shoppingCart,
      //       size: 32.0,
      //       color: Colors.black,
      //     ),
      //   ),
      // ],
      // centerTitle: center,
      // title: Text(
      //   title,
      //   style: const TextStyle(
      //       color: Colors.black,
      //       fontFamily: 'SF',
      //       fontSize: 24.0,
      //       fontWeight: FontWeight.w700),
      // ),
    );
  }
}
