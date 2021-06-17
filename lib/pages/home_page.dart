import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/app_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tech Market"),
      ),
      body: Center(
        child: Text(
          "Welcome to 30 Days of Flutter",
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
