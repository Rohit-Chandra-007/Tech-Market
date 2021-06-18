import 'package:flutter/material.dart';
import 'package:shopping_app/models/product_catalog.dart';
import 'package:shopping_app/widgets/ProductWidget.dart';
import 'package:shopping_app/widgets/app_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // If dummy list of items want to generate
    final dummyList = List.generate(50, (index) => ProductModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Tech Market"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ProductWidget(
              item: dummyList[index],
            );
          },
          itemCount: dummyList.length,
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
