import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttangkkeusmarket/app/data/cart/controller/cart_controller.dart';
import 'package:get/get.dart';
import 'package:ttangkkeusmarket/app/data/item/controller/item_controller.dart';

// ignore: must_be_immutable
class CartView extends StatelessWidget {
  late String uid = '';
  final CartController cartController = Get.put(CartController());
  final CartController controller = Get.find();
  final ItemController firestoreController = Get.put(ItemController());

  CartView({super.key});

  Future<void> getUid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getString('uid') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    getUid();
    return FutureBuilder(
      future: controller.fetchCartItemsOrCreate(uid),
      builder: (context, snapshot) {
        if (controller.cartList.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: controller.cartList.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/detail',
                      arguments: controller.cartList[index]);
                },
                title: Text(controller.cartList[index].title),
                subtitle: Text(controller.cartList[index].price.toString()),
                leading: Image.network(controller.cartList[index].imageUrl),
                trailing: InkWell(
                  onTap: () {
                    controller.removeCartItem(uid, controller.cartList[index]);
                  },
                  child: const Icon(Icons.delete),
                ),
              );
            },
          );
        }
      },
    );
  }
}
