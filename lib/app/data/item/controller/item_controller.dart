import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ttangkkeusmarket/app/data/item/controller/chip_controller.dart';
import 'package:ttangkkeusmarket/app/data/item/model/item_model.dart';

class ItemController extends GetxController {
  final CollectionReference _itemRef =
      FirebaseFirestore.instance.collection('items');

  var itemList = <Items>[].obs;
  var searchItem = <Items>[];

  final ChipController _chipController = Get.put(ChipController());

  @override
  void onInit() {
    itemList.bindStream(
        getItems(ItemCategory.values[_chipController.selectedChip]));
    super.onInit();
  }

  Future<void> fetchItems() async {
    QuerySnapshot fetchItem =
        await FirebaseFirestore.instance.collection('items').get();
  }

  Stream<List<Items>> getItems(ItemCategory category) {
    //using enum class LaptopBrand in switch case
    switch (category) {
      case ItemCategory.all:
        Stream<QuerySnapshot> stream = _itemRef.snapshots();
        return stream.map((snapshot) => snapshot.docs.map((snap) {
              return Items.fromDocumentSnapshot(snap);
            }).toList());
      case ItemCategory.fluit:
        Stream<QuerySnapshot> stream =
            _itemRef.where('category', isEqualTo: '과일').snapshots();
        return stream.map((snapshot) => snapshot.docs.map((snap) {
              return Items.fromDocumentSnapshot(snap);
            }).toList());

      case ItemCategory.vagetable:
        Stream<QuerySnapshot> stream =
            _itemRef.where('category', isEqualTo: '채소').snapshots();
        return stream.map((snapshot) => snapshot.docs.map((snap) {
              return Items.fromDocumentSnapshot(snap);
            }).toList());
      case ItemCategory.cereals:
        Stream<QuerySnapshot> stream =
            _itemRef.where('category', isEqualTo: '곡류').snapshots();
        return stream.map((snapshot) => snapshot.docs.map((snap) {
              return Items.fromDocumentSnapshot(snap);
            }).toList());
    }
  }

  Future<void> search(String query) async {
    searchItem = [];
    if (query.isEmpty) {
      return;
    }
    for (Items item in itemList) {
      if (item.title.contains(query)) {
        searchItem.add(item);
      }
    }
    update();
  }
}
