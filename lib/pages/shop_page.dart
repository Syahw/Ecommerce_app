// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app/components/my_bottom_navbar.dart';
import 'package:ecommerce_app/components/my_drawer.dart';
import 'package:ecommerce_app/components/my_product_tile.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:ecommerce_app/pages/cart_page.dart';
import 'package:ecommerce_app/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [ShopPage(), CartPage(), const SettingsPage()];

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;

    return Scaffold(
        bottomNavigationBar: MyBottomNavbar(
          onTabChange: (index) => navigateBottomBar(index),
        ),
        appBar: AppBar(
          title: Text('Shop Page'),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, "/cart_page"),
                icon: Icon(Icons.shopping_cart_outlined))
          ],
        ),
        drawer: MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: ListView(
          children: [
            // Shop subTitle
            Center(
              child: Text(
                "Pick from a selected list of premium products",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ),

            // Shop Title
            SizedBox(
              height: 550,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                padding: EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  // get each individual product from shop
                  final product = products[index];

                  // return as product tile UI
                  return MyProductTile(product: product);
                },
              ),
            ),
          ],
        ));
  }
}
