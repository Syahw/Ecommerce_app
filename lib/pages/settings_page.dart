// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Page'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.primary),
            child: ListTile(
              title: Text('Toggle Dark Mode'),
              trailing: IconButton(
                  onPressed: () =>
                      Provider.of<Shop>(context, listen: false).toggleTheme(),
                  icon: Icon(
                    Icons.toggle_off,
                    size: 40,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
