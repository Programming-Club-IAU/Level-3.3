import 'package:flutter/material.dart';

class ShopItem {
  final String itemName;
  final String itemPrice;
  final NetworkImage itemImage;

  ShopItem({
    required this.itemName,
    required this.itemPrice,
    required this.itemImage,
  });
}
