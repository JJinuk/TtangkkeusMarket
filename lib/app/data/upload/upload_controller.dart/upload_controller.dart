import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadContoller extends GetxController {
  String title = '';
  String description = '';
  String brand = '';
  String imageUrl = '';
  String price = '';
  String registerDate = '';
  String category = '';
  String id = '';

  get items => null;

  set _title(String value) {
    title = value;
    update();
  }

  set _description(String value) {
    description = value;
    update();
  }

  set _brand(String value) {
    brand = value;
    update();
  }

  set _imageUrl(String value) {
    imageUrl = value;
    update();
  }

  set _price(String value) {
    price = value;
    update();
  }

  set _registerDate(String value) {
    registerDate = value;
    update();
  }

  set _cateogry(String value) {
    category = value;
    update();
  }

  set _id(String value) {
    id = value;
    update();
  }

  Map<String, dynamic> toSnapshot() {
    return {
      'title': title,
      'description': description,
      'brand': brand,
      'imageUrl': imageUrl,
      'price': price,
      'registerDate': registerDate,
      'category': category,
    };
  }

  String get _id => id;
  String get _cateogry => category;
  String get _registerDate => registerDate;
  String get _price => price;
  String get _imageUrl => imageUrl;
  String get _brand => brand;
  String get _description => description;
  String get _title => title;

  fetchItems() {}
}
