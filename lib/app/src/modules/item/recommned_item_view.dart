import 'package:flutter/material.dart';
import 'package:ttangkkeusmarket/app/src/modules/item/widgets/carousel_list.dart';
import 'package:ttangkkeusmarket/app/core/widgets/custom_text.dart';
import 'package:ttangkkeusmarket/app/src/modules/item/list_item.dart';

class RecommendItemView extends StatelessWidget {
  const RecommendItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const Expanded(
            child: ItemBanner(),
          ),
          // const SizedBox(height: 40),
          CustomText('도움이 필요한 상품'),
          Expanded(
            child: ListItems(),
          ),
        ],
      ),
    );
    // return Container(
    //   color: Colors.orange,
    //   child: const Center(
    //     child: Text(
    //       "RECOMMEND TAB",
    //       style: TextStyle(fontSize: 24, color: Colors.white),
    //     ),
    //   ),

    // );
  }
}
