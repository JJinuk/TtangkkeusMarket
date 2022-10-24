import 'package:flutter/material.dart';
import 'package:ttangkkeusmarket/app/core/bases/base_widget_mixin.dart';
import 'package:ttangkkeusmarket/app/core/values/app_color.dart';

class CustomText extends StatelessWidget with BaseWidgetMixin {
  final String text;
  final Color fontColor;
  final double fontSize;
  final bool? centerText;
  final TextAlign textAlign;
  final FontWeight fontWeight;

  CustomText(
    this.text, {
    Key? key,
    this.fontColor = AppColor.black100,
    this.fontSize = 20,
    this.centerText,
    this.textAlign = TextAlign.left,
    this.fontWeight = FontWeight.w400,
  }) : super(key: key);

  @override
  Text body(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

// class CustomMainText extends StatelessWidget {
//   String title;

//   CustomMainText(
//     this.title, 
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 40, right: 210),
//       child: Text(
//         title,
//         style: const TextStyle(
//           fontSize: 20.0,
//           fontFamily: 'NotoSans',
//           fontWeight: FontWeight.w400,
//         ),
//       ),
//     );
//   }
// }
