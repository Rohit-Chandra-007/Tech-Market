import 'package:flutter/material.dart';
import 'package:shopping_app/core/store.dart';
import 'package:shopping_app/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          CartList().p32().expand(),
          Divider(),
          CartTotal(),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "\$${_cart.totalPrice} ",
              style: TextStyle(
                fontSize: 32,
                color: context.accentColor,
              ),
            ),
            SizedBox(
              width: 30,
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(milliseconds: 500),
                    content: Text('Buy not supported yet'),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  context.theme.buttonColor,
                ),
              ),
              child: Text(
                "Buy",
              ),
            ).w32(context),
          ],
        ),
      ),
    );
  }
}

class CartList extends StatelessWidget {
  CartList({Key? key}) : super(key: key);

  final CartModel _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? "No Item in Cart".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_cart.items[index].name),
                leading: Icon(Icons.done),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    _cart.remove(_cart.items[index]);
                  },
                ),
              );
            });
  }
}
