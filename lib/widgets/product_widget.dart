import 'package:flutter/material.dart';
import 'package:shopping_app/models/product_catalog.dart';

class ProductWidget extends StatelessWidget {
  final Item? item;

  const ProductWidget({Key? key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("${item!.name} pressed");
        },
        leading: Image.network(item!.image),
        title: Text(item!.name),
        subtitle: Text(item!.desc),
        trailing: Text(
          "\$${item!.price}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}
