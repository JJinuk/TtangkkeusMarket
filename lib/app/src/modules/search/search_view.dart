import 'package:flutter/material.dart';
import 'package:ttangkkeusmarket/app/core/models/query_model.dart';
import 'package:ttangkkeusmarket/app/data/item/controller/item_controller.dart';
import 'package:get/get.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemController itemController = Get.put(ItemController());
    QueryController querycontroller = Get.put(QueryController());

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            TextField(
              onChanged: (text) {
                querycontroller.updateText(text);
              },
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'search keyword',
                border: InputBorder.none,
              ),
              cursorColor: Colors.grey,
            )
          ],
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
              onPressed: () {
                itemController.search(querycontroller.text);
              },
              icon: const Icon(Icons.search_rounded))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.5,
                  ),
                  itemCount: itemController.searchItem.length,
                  itemBuilder: (context, index) {
                    return GridTile(
                        child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/detail',
                            arguments: itemController.searchItem[index]);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                                itemController.searchItem[index].imageUrl),
                            Text(
                              itemController.searchItem[index].title,
                              style: const TextStyle(fontSize: 20),
                            ),
                            Text(
                              '${itemController.searchItem[index].price}원',
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.red),
                            )
                          ],
                        ),
                      ),
                    ));
                  }))
        ],
      ),
    );
  }
}
