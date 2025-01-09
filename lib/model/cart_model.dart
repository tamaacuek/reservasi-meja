import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  //list of item on sale
  final List _shopitems = [
    //itemName, itemPrice, imagePaths (list), color, description
    [
      "2 PEOPLE",
      "24.62",
      [
        "lib/assets/images/2orang.jpg",
        "lib/assets/images/2orang.jpg",
        "lib/assets/images/2orang.jpg",
      ],
      Colors.brown,
      "Meja ini memiliki kapasitas 2 orang, cocok untuk dinner date maupun acara khusus"
    ],
    [
      "5 PEOPLE",
      "49.24",
      [
        "lib/assets/images/5orang.jpg",
        "lib/assets/images/5orang.jpg",
        "lib/assets/images/5orang.jpg",
      ],
      Colors.blueGrey,
      "Meja ini memiliki kapasitas 5 orang, cocok untuk acara keluarga maupun acara khusus"
    ],
    [
      "8 PEOPLE",
      "73.87",
      [
        "lib/assets/images/8orang.jpg",
        "lib/assets/images/8orang.jpg",
        "lib/assets/images/8orang.jpg",
      ],
      Colors.orange,
      "Meja ini memiliki kapasitas 8 orang, cocok untuk acara besar maupun acara khusus"
    ],
    [
      "8 (Meeting)",
      "98.49 ",
      [
        "lib/assets/images/8meeting.jpg",
        "lib/assets/images/8meeting.jpg",
        "lib/assets/images/8meeting.jpg",
      ],
      Colors.grey,
      "Meja ini memiliki kapasitas 8 orang, cocok untuk meeting maupun acara khusus"
    ],
    [
      "12 PEOPLE",
      "148.08",
      [
        "lib/assets/images/12orang.jpg",
        "lib/assets/images/12orang.jpg",
        "lib/assets/images/12orang.jpg",
      ],
      Colors.brown,
      "Meja ini memiliki kapasitas 12 orang, cocok untuk acara besar maupun acara khusus"
    ],
    [
      "Wedding Table",
      "98.49",
      [
        "lib/assets/images/nikah.png",
        "lib/assets/images/nikah.png",
        "lib/assets/images/nikah.png",
      ],
      Colors.yellow,
      "Meja ini memiliki kapasitas 6 orang, digunakan untuk pernikahan"
    ],
  ];

  //list of cart items
  final List<Map<String, dynamic>> _cartItems = [];

  get shopItems => _shopitems;

  get cartItems => _cartItems;

  // Add item to cart or increase quantity
  void addItemToCart(int index) {
    String itemName = _shopitems[index][0];

    // Check if the item already exists in the cart
    int existingIndex =
        _cartItems.indexWhere((item) => item['name'] == itemName);
    if (existingIndex != -1) {
      _cartItems[existingIndex]['quantity'] += 1; // Increase quantity
    } else {
      _cartItems.add({
        'name': itemName,
        'price': double.parse(_shopitems[index][1]),
        'image': _shopitems[index][2],
        'quantity': 1,
      });
    }
    notifyListeners();
  }

  // Remove item from cart or decrease quantity
  void removeItemFromCart(int index) {
    if (_cartItems[index]['quantity'] > 1) {
      _cartItems[index]['quantity'] -= 1; // Decrease quantity
    } else {
      _cartItems.removeAt(index); // Remove item if quantity is 0
    }
    notifyListeners();
  }

  // Calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (var item in _cartItems) {
      totalPrice += item['price'] * item['quantity'];
    }
    return totalPrice.toStringAsFixed(2);
  }

  // Remove item completely from cart
  void removeCompletelyFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // Clear all items from the cart
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
