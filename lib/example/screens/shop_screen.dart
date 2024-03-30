import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/example/providers/shopping_provider.dart';
import 'package:todo_list/example/screens/cart_screen.dart';
import 'package:todo_list/example/screens/widgets/item_card.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartScreen(),
            ),
          );
        },
        child: const Icon(Icons.shopping_cart),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 64),
        child: Column(
          children: [
            Text(
              'Please select your Items',
              textAlign: TextAlign.center,
              style: GoogleFonts.adamina(
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Consumer<ShoppingProvider>(
              builder: (context, providerInfo, child) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: providerInfo.items.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ItemCard(
                          itemName: providerInfo.items[index].itemName,
                          itemPrice: providerInfo.items[index].itemPrice,
                          itemImage: providerInfo.items[index].itemImage,
                          onTap: () {
                            providerInfo.addItem(providerInfo.items[index]);
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
