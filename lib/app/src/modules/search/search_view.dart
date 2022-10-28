import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ttangkkeusmarket/app/core/models/query_model.dart';
import 'package:ttangkkeusmarket/app/core/values/app_color.dart';
import 'package:ttangkkeusmarket/app/core/widgets/custom_appbar.dart';
import 'package:ttangkkeusmarket/app/data/item/controller/item_controller.dart';
import 'package:ttangkkeusmarket/app/src/modules/cart/cart_screen.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  FocusNode focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '마이페이지',
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartView(),
                ),
              ),
            },
            icon: const Icon(
              LineIcons.shoppingCart,
              size: 32.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              cursorColor: AppColor.yellow100,
              focusNode: focus,
              onChanged: (value) {
                setState(
                  () {
                    // query = value;
                  },
                );
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: AppColor.gray100,
                filled: true,
                hintText: "검색어를 입력해주세요",
                contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                suffixIcon: Icon(
                  Icons.search,
                  color: focus.hasFocus ? AppColor.yellow100 : AppColor.gray200,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
