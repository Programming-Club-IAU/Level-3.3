import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/example/providers/shopping_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: GoogleFonts.adamina(
            fontSize: 32,
          ),
        ),
      ),
      body: Consumer<ShoppingProvider>(
        builder: (context, providerInfo, child) {
          return ListView.builder(
            itemCount: providerInfo.cartItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: providerInfo.cartItems[index].itemImage,
                  ),
                  title: Text(
                    providerInfo.cartItems[index].itemName,
                    style: GoogleFonts.adamina(
                      fontSize: 24,
                    ),
                  ),
                  subtitle: Text(
                    providerInfo.cartItems[index].itemPrice,
                    style: GoogleFonts.adamina(
                      fontSize: 16,
                    ),
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      providerInfo.removeItem(providerInfo.cartItems[index]);
                    },
                    child: const Icon(Icons.delete),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
