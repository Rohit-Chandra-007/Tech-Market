import 'package:flutter/material.dart';
import 'package:shopping_app/pages/home_page.dart';
import 'package:shopping_app/pages/login_page.dart';
import 'package:shopping_app/utils/routes.dart';
import 'package:shopping_app/widgets/app_theme.dart';

void main() {
  runApp(ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),
      initialRoute: AppRoutes.homeRoute,
      routes: {
        AppRoutes.loginRoute: (context) => LoginPage(),
        AppRoutes.homeRoute: (context) => HomePage()
      },
    );
  }
}
