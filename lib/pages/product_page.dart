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
      appBar: AppBar(
        backgroundColor: AppTheme.creamColor,
      ),
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
                child: 'Add to Cart'.text.make(),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppTheme.darkBluishColor),
                    shape: MaterialStateProperty.all(StadiumBorder())),
              ).wh(120, 50),
            )
          ],
        ).p24(),
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
                      10.heightBox,
                      Expanded(
                          child: "Dolor sea takimata ipsum sea eirmod aliquyam est. "
                                  "Eos ipsum voluptua eirmod elitr, no dolor dolor amet"
                                  " eirmod dolor labore dolores magna. Amet vero vero"
                                  " vero kasd, dolore sea sed sit invidunt nonumy est "
                                  "sit clita. Diam aliquyam amet tempor diam no aliquyam"
                                  " invidunt. Elitr lorem eirmod dolore clita. Rebum."
                              .text
                              .textStyle(context.captionStyle!)
                              .make()
                              .p12())
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
