import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ttangkkeusmarket/app/data/item/model/item_model.dart';

class CartController extends GetxController {
  late CollectionReference? _cartRef;
  var cartList = <Items>[];
  Future<void> fetchCartItemsOrCreate(String uid) async {
    if (uid == '') {
      return;
    }
    final cartSnapshot = await _cartRef?.doc(uid).get();
    if (cartSnapshot!.exists) {
      Map<String, dynamic> cartItemsMap =
          cartSnapshot.data() as Map<String, dynamic>;
      List<Items> temp = [];
      for (var item in cartItemsMap['items']) {
        temp.add(Items.fromMap(item));
      }
      cartList = temp;
    } else {
      await _cartRef?.doc(uid).set({'items': []});
    }
  }

  Future<void> addCartItem(String uid, Items item) async {
    cartList.add(item);
    Map<String, dynamic> cartItemsMap = {
      'items': cartList.map((item) {
        return item.toSnapshot();
      }).toList()
    };
    await _cartRef?.doc(uid).set(cartItemsMap);
  }

  Future<void> removeCartItem(String uid, Items item) async {
    cartList.removeWhere((element) => element.id == item.id);
    Map<String, dynamic> cartItemsMap = {
      'items': cartList.map((item) {
        return item.toSnapshot();
      }).toList()
    };

    await _cartRef?.doc(uid).set(cartItemsMap);
  }

  bool isCartItemIn(Items item) {
    return cartList.any((element) => element.id == item.id);
  }
}
