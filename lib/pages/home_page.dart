import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_app/models/catalog.dart';
import 'package:shopping_app/utils/routes.dart';
import 'package:shopping_app/widgets/catalog_header.dart';
import 'package:shopping_app/widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // If dummy list of items want to generate
    // final dummyList = List.generate(50, (index) => ProductModel.items[0]);
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.cartRoute);
        },
        backgroundColor: context.theme.buttonColor,
        child: Icon(
          CupertinoIcons.shopping_cart,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                Expanded(child: CatalogList().py16())
              else
                Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: context.theme.buttonColor,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJSON =
        await rootBundle.loadString('assets/files/catalog.json');
    final decodeJSON = jsonDecode(catalogJSON);
    var productData = decodeJSON['products'];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }
}
