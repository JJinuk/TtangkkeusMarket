import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ttangkkeusmarket/app/core/models/query_model.dart';
import 'package:ttangkkeusmarket/app/src/providers/item_provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context);
    final queryProvider = Provider.of<QueryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            TextField(
              onChanged: (text) {
                queryProvider.updateText(text);
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
                itemProvider.search(queryProvider.text);
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
                  itemCount: itemProvider.searchItem.length,
                  itemBuilder: (context, index) {
                    return GridTile(
                        child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/detail',
                            arguments: itemProvider.searchItem[index]);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                                itemProvider.searchItem[index].imageUrl),
                            Text(
                              itemProvider.searchItem[index].title,
                              style: const TextStyle(fontSize: 20),
                            ),
                            Text(
                              '${itemProvider.searchItem[index].price}원',
                              style: const TextStyle(fontSize: 16, color: Colors.red),
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
