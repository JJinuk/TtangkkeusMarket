import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddState extends GetxController {
  int Image_q = 0;
  late String Image_Url;

  late String downloadUrl;

  late File _image;
  final picker = ImagePicker();
  //final _valueList = ['상품명', '개수', '종류'];
  //var _selectedValue = 'Top';
  //var selectCheck = int.parse('1');

//
  final GlobalKey<FormState> _titlefk = GlobalKey<FormState>();
  final GlobalKey<FormState> _topfk = GlobalKey<FormState>();
  final GlobalKey<FormState> _bottomfk = GlobalKey<FormState>();
  final GlobalKey<FormState> _shoesfk = GlobalKey<FormState>();
  final GlobalKey<FormState> _sellerfk = GlobalKey<FormState>();

//
  TextEditingController product_name = TextEditingController(); //상품이름
  TextEditingController product_price = TextEditingController(); //상품가격
  TextEditingController product_stock = TextEditingController(); //재고량
  TextEditingController product_description = TextEditingController(); //상품 설명
  TextEditingController phone_number = TextEditingController();
  TextEditingController count_number = TextEditingController();
  TextEditingController bank_name = TextEditingController();

  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

//컬렉션 명
  final String colName = 'Image_collection';

//필드명
  final String Image_Title = "title";
  final String Image_URL = "image_url";
  final String Image_price = "price";
  final String Image_stock = "stock";
  final String Image_description = "description";
  final String Image_phone_number = 'phone_number';
  final String Image_count_number = 'count_number';
  final String Image_bank_name = 'bank_name';

//firebase 필드,값 데이터 저장
  void createDoc(
      String name,
      String URL,
      String price,
      String stock,
      String description,
      String phoneNumber,
      String countNumber,
      String bankName) {
    FirebaseFirestore.instance.collection(colName).doc(name).set({
      Image_Title: name,
      Image_URL: URL,
      Image_price: price,
      Image_stock: stock,
      Image_description: description,
      Image_phone_number: phoneNumber,
      Image_count_number: countNumber,
      Image_bank_name: bankName,
    });
  }

//firebase 에 이미지 업로드 하는 함수
  _Update() async {
    Reference ref =
        _firebaseStorage.ref().child("profile/${product_name.text}");
    UploadTask uploadTask = ref.putFile(_image);

    // 파일 업로드 완료까지 대기
    TaskSnapshot taskSnapshot = await uploadTask;

    String downloadUrl = await ref.getDownloadURL();

    Image_q++;

    createDoc(
        product_name.text,
        product_price.text,
        product_stock.text,
        product_description.text,
        downloadUrl,
        phone_number.text,
        count_number.text,
        bank_name.text);

    return downloadUrl;
  }

//  void reset() {
  //  _titlefk.currentState!.reset();
  //_topfk.currentState!.reset();
  //_bottomfk.currentState!.reset();
  //_shoesfk.currentState!.reset();
  //_sellerfk.currentState!.reset();
  // }

  Widget _BuildCameraButton() {
    return InkWell(
      child: Icon(
        Icons.camera_alt,
        color: Colors.white,
        size: 50,
      ),
      onTap: () async {
        await getImage(ImageSource.camera);
      },
    );
  }

  Widget _BuildPhotoAlbumeButton() {
    return InkWell(
      child: Icon(Icons.image, color: Colors.white, size: 50),
      onTap: () async {
        await getImage(ImageSource.gallery);
      },
    );
  }

//사진 파일 압축
  Future<File> _compressImage(XFile? file, String targetPath) async {
    var result = await FlutterImageCompress.compressAndGetFile(
        file!.path, targetPath,
        quality: 88, minWidth: 500, minHeight: 500
        //rotate: 180,
        );

    //단위 바이트 확률 높음

    print(result!.lengthSync());

    return result;
  }

  //image을 가져오는 함수

  Future getImage(ImageSource source) async {
    //ignore: deprecated_member_use
    final XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.gallery); // source을 통해 이미지를 가져온다.
    var tempDir = await getTemporaryDirectory(); // 디렉토리경로를 가져온다.
    String tempPath = path.join(tempDir.path, path.basename(image!.path));

    File tempImage = await _compressImage(image, tempPath); // 이미지 파일 압축

    //이미지에 이미지를 가져온 파일 경로에 있는 파일을 대입한다.
  }
}
