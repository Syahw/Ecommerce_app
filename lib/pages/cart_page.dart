// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_app/components/my_button.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("Remove this item in your cart ?"),
              actions: [
                // cancel button
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),

                // add button
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);

                    context.read<Shop>().removeFromCart(product);
                  },
                  child: Text("Yes"),
                )
              ],
            ));
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("Check out items now?"),
              actions: [
                // cancel button
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),

                // add button
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Text(
                            "You have successfully check out all the items!"),
                      ),
                    );
                  },
                  child: Text("Yes"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    // get access to cart

    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Column(
        children: [
          //cart list
          Expanded(
            child: cart.isEmpty
                ? Center(child: Text("Your cart is empty"))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];

                      return ListTile(
                        leading: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(item.imagePath)),
                        title: Text(item.name),
                        subtitle: Text(item.price.toStringAsFixed(2)),
                        trailing: IconButton(
                            onPressed: () => removeItemFromCart(context, item),
                            icon: Icon(Icons.remove)),
                      );
                    },
                  ),
          ),
          // pay button

          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: SizedBox(
              width: 350,
              child: MyButton(
                  onTap: () => payButtonPressed(context),
                  child: Center(child: Text("CHECK OUT NOW "))),
            ),
          ),
        ],
      ),
    );
  }
}
