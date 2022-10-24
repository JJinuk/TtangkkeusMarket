import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ttangkkeusmarket/app/data/item/controller/item_controller.dart';

class ListItems extends StatelessWidget {
  final ItemController itemController = Get.put(ItemController());
  final CollectionReference _itemRef =
      FirebaseFirestore.instance.collection('items');
  ListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: itemController.fetchItems(),
      builder: (context, snapshots) {
        if (itemController.itemList.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(10),
            itemCount: itemController.itemList.length,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 12);
            },
            itemBuilder: (context, index) {
              return GridTile(
                  child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/detail',
                      arguments: itemController.itemList[index]);
                },
                child: SizedBox(
                  width: 205.0,
                  height: 30.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        fit: BoxFit.contain,
                        image: NetworkImage(
                          itemController.itemList[index].imageUrl,
                        ),
                      ),
                      Text(
                        itemController.itemList[index].title,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ));
            },
          );
        }
      },
    );
  }
}

Widget buildCard(int index) => Container(
      color: Colors.amber,
      width: 115.0,
      height: 138.0,
      child: Center(
        child: Text('$index'),
      ),
    );
// SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.all(10),
//         child: Row(
//           children: [
//             buildCard(1),
//             const SizedBox(width: 10),
//             buildCard(2),
//             const SizedBox(width: 10),
//             buildCard(3),
//             const SizedBox(width: 10),
//             buildCard(4),
//             const SizedBox(width: 10),
//             buildCard(5),
//             const SizedBox(width: 10),
//             buildCard(6),
//             const SizedBox(width: 10),
//           ],
//         ),
//       ),