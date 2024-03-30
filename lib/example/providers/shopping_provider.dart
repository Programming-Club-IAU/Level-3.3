import 'package:flutter/material.dart';
import 'package:todo_list/example/models/item_model.dart';

class ShoppingProvider extends ChangeNotifier {
  List<ShopItem> allItems = [
    ShopItem(
      itemName: "Iphone 15",
      itemPrice: "6999SAR",
      itemImage: const NetworkImage(
          "https://purepng.com/public/uploads/large/purepng.com-iphone-xiphone-xapplescreen-21530617565atiut.png"),
    ),
    ShopItem(
      itemName: "Iphone 13",
      itemPrice: "6999SAR",
      itemImage: const NetworkImage(
          "https://purepng.com/public/uploads/large/purepng.com-iphone-xiphone-xapplescreen-21530617565atiut.png"),
    ),
    ShopItem(
      itemName: "Iphone 12",
      itemPrice: "6999SAR",
      itemImage: const NetworkImage(
          "https://purepng.com/public/uploads/large/purepng.com-iphone-xiphone-xapplescreen-21530617565atiut.png"),
    ),
    ShopItem(
      itemName: "Iphone 12",
      itemPrice: "6999SAR",
      itemImage: const NetworkImage(
          "https://purepng.com/public/uploads/large/purepng.com-iphone-xiphone-xapplescreen-21530617565atiut.png"),
    ),
    ShopItem(
      itemName: "Iphone 12",
      itemPrice: "6999SAR",
      itemImage: const NetworkImage(
          "https://purepng.com/public/uploads/large/purepng.com-iphone-xiphone-xapplescreen-21530617565atiut.png"),
    ),
    ShopItem(
      itemName: "Iphone 12",
      itemPrice: "6999SAR",
      itemImage: const NetworkImage(
          "https://purepng.com/public/uploads/large/purepng.com-iphone-xiphone-xapplescreen-21530617565atiut.png"),
    ),
    ShopItem(
      itemName: "Iphone 12",
      itemPrice: "6999SAR",
      itemImage: const NetworkImage(
          "https://purepng.com/public/uploads/large/purepng.com-iphone-xiphone-xapplescreen-21530617565atiut.png"),
    ),
  ];

  List<ShopItem> get items => allItems;

  List<ShopItem> addedToCart = [];

  List<ShopItem> get cartItems => addedToCart;

  void addItem(ShopItem item) {
    addedToCart.add(item);
    notifyListeners();
  }

  void removeItem(ShopItem item) {
    addedToCart.remove(item);
    notifyListeners();
  }
}
