import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ttangkkeusmarket/app/data/item/model/item_model_old.dart';


class ItemProvider with ChangeNotifier {
  late CollectionReference itemsReference;
  List<Item> items = [];
  List<Item> searchItem = [];

  ItemProvider({reference}) {
    itemsReference =
        reference ?? FirebaseFirestore.instance.collection('items');
  }

  Future<void> fetchItems() async {
    items = await itemsReference.get().then((QuerySnapshot results) {
      return results.docs.map((DocumentSnapshot document) {
        return Item.fromSnapshot(document);
      }).toList();
    });
    notifyListeners();
  }

  Future<void> search(String query) async {
    searchItem = [];
    if (query.isEmpty) {
      return;
    }
    for (Item item in items) {
      if (item.title.contains(query)) {
        searchItem.add(item);
      }
    }
    notifyListeners();
  }
}
