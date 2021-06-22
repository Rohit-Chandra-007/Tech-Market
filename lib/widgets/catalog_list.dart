import 'package:flutter/material.dart';
import 'package:shopping_app/models/product_catalog.dart';
import 'package:shopping_app/pages/product_page.dart';

import 'catalog_item.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final productItem = ProductModel.getByPosition(index);
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ProductPage(productItem: ProductModel.getById(2));
            }));
          },
          child: CatalogItem(
            catalog: productItem,
          ),
        );
      },
      itemCount: ProductModel.items!.length,
    );
  }
}
