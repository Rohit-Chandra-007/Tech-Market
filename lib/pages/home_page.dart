import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_app/models/product_catalog.dart';
import 'package:shopping_app/widgets/app_theme.dart';
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
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (ProductModel.items != null && ProductModel.items!.isNotEmpty)
                Expanded(child: CatalogList())
              else
                Center(
                  child: CircularProgressIndicator(),
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
    ProductModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        'Catalog  App'.text.xl5.bold.color(AppTheme.darkBluishColor).make(),
        'Trending Product'.text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final productItem = ProductModel.items![index];
        return CatalogItem(
          catalog: productItem,
        );
      },
      itemCount: ProductModel.items!.length,
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(image: catalog.image),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(AppTheme.darkBluishColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle!).make(),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  '\$${catalog.price}'.text.bold.xl.make(),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: 'Buy'.text.make(),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              AppTheme.darkBluishColor),
                          shape: MaterialStateProperty.all(StadiumBorder())),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    )).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(AppTheme.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}
