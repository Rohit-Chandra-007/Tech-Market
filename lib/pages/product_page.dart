import 'package:flutter/material.dart';
import 'package:shopping_app/models/catalog.dart';
import 'package:shopping_app/widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductPage extends StatelessWidget {
  final Item productItem;
  final String productDetails = "Dolor sea takimata ipsum sea eirmod "
      "aliquyam est.Eos ipsum voluptua eirmod elitr, no dolor dolor amet"
      " eirmod dolor labore dolores magna. Amet vero vero"
      " vero kasd, dolore sea sed sit invidunt nonumy est "
      "sit clita. Diam aliquyam amet tempor diam no aliquyam"
      " invidunt. Elitr lorem eirmod dolore clita. Rebum.";

  const ProductPage({Key? key, required this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              '\$${productItem.price}'.text.bold.xl4.red400.make(),
              AddToCart(
                catalog: productItem,
              ).wh(80, 40)
            ],
          ),
        ),
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
                  color: context.cardColor,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 64),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              productItem.name,
                              style: TextStyle(
                                  color: context.accentColor,
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              productItem.desc,
                              style: Theme.of(context).textTheme.caption!.apply(
                                  fontSizeFactor: 1.5,
                                  fontSizeDelta: 1.2,
                                  fontFeatures: []),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              productDetails,
                              textAlign: TextAlign.justify,
                              style: Theme.of(context).textTheme.caption!.apply(
                                    fontSizeFactor: 1.2,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
