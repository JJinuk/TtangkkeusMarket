import 'package:cloud_firestore/cloud_firestore.dart';

enum ItemCategory { all, fluit, vagetable, cereals }

class Items {
  late String id;
  late String title;
  late String brand;
  late String description;
  late String imageUrl;
  late String registerDate;
  late String price;
  late String category;

  Items({
    required this.id,
    required this.title,
    required this.brand,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.registerDate,
    required this.category,
  });

  Items.fromDocumentSnapshot(QueryDocumentSnapshot snapshot) {
    id = snapshot.id;
    title = snapshot.get('title');
    brand = snapshot.get('brand');
    description = snapshot.get('description');
    imageUrl = snapshot.get('imageUrl');
    price = snapshot.get('price');
    registerDate = snapshot.get('registerDate');
    category = snapshot.get('category');
  }
  Items.fromMap(data) {
    id = data['id'];
    title = data['title'];
    brand = data['brand'];
    description = data['description'];
    imageUrl = data['imageUrl'];
    price = data['price'];
    registerDate = data['registerDate'];
  }
  Map<String, dynamic> toSnapshot() {
    return {
      'id': id,
      'title': title,
      'brand': brand,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'registerDate': registerDate
    };
  }
}
