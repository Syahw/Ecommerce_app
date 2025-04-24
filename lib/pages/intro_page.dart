// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_app/components/my_button.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Icon(
                Icons.shopping_bag,
                size: 72,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              SizedBox(
                height: 25,
              ),
              //title

              Text(
                'Minimalist Shop',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              //subtitle
              Text(
                'Premium Quality Products',
                style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),

              //button
              const SizedBox(
                height: 20,
              ),
              MyButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/shop_page');
                  },
                  child: Icon(Icons.arrow_right_alt))
            ],
          ),
        ));
  }
}
