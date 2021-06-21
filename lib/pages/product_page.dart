import 'package:flutter/material.dart';
import 'package:shopping_app/models/product_catalog.dart';
import 'package:shopping_app/widgets/app_theme.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductPage extends StatelessWidget {
  final Item productItem;

  const ProductPage({Key? key, required this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            '\$${productItem.price}'.text.bold.xl4.red400.make(),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ElevatedButton(
                onPressed: () {},
                child: 'Buy'.text.make(),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppTheme.darkBluishColor),
                    shape: MaterialStateProperty.all(StadiumBorder())),
              ).wh(100, 50),
            )
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(productItem.id.toString()),
              child: Image.network(productItem.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    children: [
                      productItem.name.text.xl4
                          .color(AppTheme.darkBluishColor)
                          .bold
                          .make(),
                      productItem.desc.text
                          .textStyle(context.captionStyle!)
                          .xl
                          .make(),
                      10.heightBox
                    ],
                  ).py64(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
