// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_app/components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Drawer header : logo
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 72,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
              // shop tile
              MyListTile(
                  text: "Shop",
                  icon: Icons.home,
                  onTap: () => Navigator.pop(context)),
              // cert tile
              MyListTile(
                  text: "Cart",
                  icon: Icons.shopping_cart,
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.pushNamed(context, "/cart_page");
                  }),

              MyListTile(
                  text: "Settings",
                  icon: Icons.settings,
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.pushNamed(context, "/setting_page");
                  }),
            ],
          ),
          // exit shop tile
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: MyListTile(
                text: "Logout",
                icon: Icons.logout_outlined,
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, "/intro_page", (route) => false)),
          ),
        ],
      ),
    );
  }
}
