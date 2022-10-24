import 'package:flutter/material.dart';
import 'package:ttangkkeusmarket/app/core/values/app_color.dart';

mixin BaseWidgetMixin on StatelessWidget {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  Widget body(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        color: AppColor.black100,
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontFamily: 'NotoSans',
      ),
      child: body(context),
    );
  }
}
