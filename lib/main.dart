import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/pages/home_page.dart';
import 'package:shopping_app/pages/login_page.dart';
import 'package:shopping_app/utils/routes.dart';

void main() {
  runApp(ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: AppRoutes.loginRoute,
      routes: {
        AppRoutes.loginRoute: (context) => LoginPage(),
        AppRoutes.homeRoute: (context) => HomePage()
      },
    );
  }
}
