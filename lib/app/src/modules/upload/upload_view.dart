import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:get/get.dart';
import 'package:ttangkkeusmarket/app/data/item/controller/item_controller.dart';
import 'package:ttangkkeusmarket/app/data/upload/upload_controller.dart/upload_controller.dart';

class AdminItemAdd extends StatelessWidget {
  const AdminItemAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: '상품 등록',
      home: UploadView(title: '관리자 상품 등록'),
    );
  }
}

class UploadView extends StatefulWidget {
  final String title;

  const UploadView({Key? key, required this.title}) : super(key: key);

  @override
  _UploadViewState createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  FirebaseStorage storage = FirebaseStorage.instance;
  final UploadContoller uploadcontroller = Get.put(UploadContoller());
  static String uploadFolder = 'items';
  bool isLoading = false;
  File? _image;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const Text('상품 등록', style: TextStyle(fontSize: 24)),
                const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(2),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    const TableRow(children: [
                      Text('Title'),
                      CustomTextFormField("Title")
                    ]),
                    const TableRow(children: [
                      Text('Description'),
                      CustomTextFormField("Description")
                    ]),
                    const TableRow(children: [
                      Text('Brand'),
                      CustomTextFormField("Brand")
                    ]),
                    const TableRow(children: [
                      Text('price'),
                      CustomTextFormField("price")
                    ]),
                    const TableRow(children: [
                      Text('RegisterDate'),
                      CustomTextFormField("RegisterDate")
                    ]),
                    const TableRow(children: [
                      Text('category'),
                      CustomTextFormField("category")
                    ]),
                    TableRow(children: [
                      const Text('Image'),
                      TextButton.icon(
                        label: const Text("Galery Open",
                            style: TextStyle(fontSize: 16)),
                        icon: const Icon(Icons.browse_gallery),
                        onPressed: () async {
                          getGalleryImage();
                        },
                      ),
                    ]),
                  ],
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                _image == null
                    ? const Text('No image selected',
                        style: TextStyle(fontSize: 20))
                    : Image.file(_image!, fit: BoxFit.fill, height: 250),
                const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton.icon(
                        label: const Text("저장", style: TextStyle(fontSize: 20)),
                        icon: const Icon(Icons.login),
                        onPressed: () {
                          onPressedAdd(UploadContoller());
                        },
                      ),
              ],
            ),
          ),
        ));
  }

  Future getGalleryImage() async {
    final picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image!.path);
    });
  }

  Future<void> onPressedAdd(UploadContoller uploadcontroller) async {
    if (_image != null) {
      setState(() {
        isLoading = true;
      });

      int t = Timestamp.now().millisecondsSinceEpoch;
      Reference ref = FirebaseStorage.instance.ref();
      TaskSnapshot snapshot =
          await ref.child("$uploadFolder/gallery_$t").putFile(_image!);

      if (snapshot.state == TaskState.success) {
        final String downloadUrl = await snapshot.ref.getDownloadURL();
        uploadcontroller.imageUrl = downloadUrl;
        await FirebaseFirestore.instance
            .collection(uploadFolder)
            .add(uploadcontroller.toSnapshot());
        setState(() {
          isLoading = false;
        });
        const snackBar = SnackBar(content: Text('Upload Success'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      const snackBar = SnackBar(content: Text('No image selected'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    Navigator.pushReplacementNamed(context, '/');
  }
}

class CustomTextFormField extends StatelessWidget {
  final String text;

  const CustomTextFormField(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final UploadContoller uploadcontroller = Get.put(UploadContoller());

    String? initialValue;
    if (text == 'RegisterDate') {
      initialValue = DateTime.now().toString().split(' ')[0];
      uploadcontroller.registerDate = initialValue;
    }
    return TextFormField(
      initialValue: initialValue,
      validator: (value) => value!.isEmpty ? "입력필수" : null,
      onChanged: (value) {
        switch (text) {
          case 'Title':
            uploadcontroller.title = value;
            break;
          case 'Description':
            uploadcontroller.description = value;
            break;
          case 'Brand':
            uploadcontroller.brand = value;
            break;
          case 'Price':
            uploadcontroller.price = value;
            break;
          case 'RegisterDate':
            uploadcontroller.registerDate = value;
            break;
          case 'Part':
            uploadcontroller.category = value;
            break;
        }
      },
    );
  }
}
