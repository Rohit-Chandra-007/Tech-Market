import 'package:flutter/material.dart';
import 'package:shopping_app/models/product_catalog.dart';
import 'package:velocity_x/velocity_x.dart';

import 'app_theme.dart';
import 'catalog_image.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.image)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg
                    .color(AppTheme.darkBluishColor)
                    .bold
                    .make(),
                catalog.desc.text.textStyle(context.captionStyle!).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    '\$${catalog.price}'.text.bold.xl.make(),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: 'Add to Cart'.text.make(),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                context.theme.buttonColor),
                            shape: MaterialStateProperty.all(StadiumBorder())),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}
