import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('items');

class Database {
  static String? userUid;
  static String? title;
  static String? description;
  static String? price;
  static String? imageUrl;
  static String? brand;
  static String? category;
}

Future<void> addItem(
    {required String userUid,
    required String title,
    required String brand,
    required String description,
    required String imageUrl,
    required int price,
    required String registerDate,
    required String category}) async {
  DocumentReference documentReferencer =
      _mainCollection.doc(userUid).collection('items').doc();

  Map<String, dynamic> data = <String, dynamic>{
    "title": title,
    "description": description,
    "brand": brand,
    "imageUrl": imageUrl,
    "price": price,
    "registerDate": registerDate,
    "category": category
  };
  await documentReferencer
      .set(data)
      .whenComplete(() => print("items added to database"))
      .catchError((e) => print(e));

  Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection =
        _mainCollection.doc(userUid).collection('items');

    return notesItemCollection.snapshots();
  }

  Future<void> updateItem(
      {required String title,
      required String description,
      required String docId,
      required String brand,
      required String price,
      required String imageUrl,
      required String categry}) async {
    DocumentReference documentReference =
        _mainCollection.doc(userUid).collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description,
      "brand": brand,
      "imageUrl": imageUrl,
      "price": price,
      "registerDate": registerDate,
      "category": category,
    };
    await documentReferencer
        .update(data)
        .whenComplete(() => print("item updated in the database"))
        .catchError((e) => print(e));
  }

  Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documemtReferencer =
        _mainCollection.doc(userUid).collection('items').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('item deleted from the database'))
        .catchError((e) => print(e));
  }
}
