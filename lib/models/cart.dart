import 'package:shopping_app/models/product_catalog.dart';

class CarModel {
  // catalog field
  ProductModel? _productModel;

  // Collection of ID's store ids of each item
  final List<int> _itemIds = [];

  ProductModel get catalog => _productModel!;

  set catalog(ProductModel productModel) {
    _productModel = productModel;
  }

  // get item in the cart
  List<Item> get items =>
      _itemIds.map((id) => _productModel!.getById(id)).toList();

  // get total price

  num get totalPrice =>
      items.fold(0, (total, current) => totalPrice + current.price);

  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
