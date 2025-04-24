// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_app/models/shop.dart';
import 'package:ecommerce_app/pages/cart_page.dart';
import 'package:ecommerce_app/pages/intro_page.dart';
import 'package:ecommerce_app/pages/settings_page.dart';
import 'package:ecommerce_app/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Shop(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
        theme: Provider.of<Shop>(context).themeData,
        routes: {
          '/intro_page': (context) => IntroPage(),
          '/shop_page': (context) => ShopPage(),
          '/cart_page': (context) => CartPage(),
          '/setting_page': (context) => SettingsPage(),
        });
  }
}
