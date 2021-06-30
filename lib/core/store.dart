import 'package:shopping_app/models/cart.dart';
import 'package:shopping_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  CatalogModel catalog = CatalogModel();
  CartModel cart = CartModel();

  MyStore() {
    cart.catalog = catalog;
  }
}
