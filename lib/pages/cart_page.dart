import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tama_app/model/cart_model.dart';
// import 'package:tama_app/pages/confirm_page.dart';
// import 'package:tama_app/pages/homePage.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Cart",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.grey[800],
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          if (value.cartItems.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon or Image
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 100,
                    color: Colors.grey,
                  ),
                  // Uncomment this if you want to use an image
                  // Image.asset(
                  //   'lib/assets/images/empty_cart.png',
                  //   width: 150,
                  //   height: 150,
                  // ),
                  SizedBox(height: 20), // Spacer
                  // Text
                  Text(
                    "Cart is empty",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: value.cartItems.length,
                  padding: EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    var item = value.cartItems[index];
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            item['image'][0],
                            height: 36,
                          ),
                          title: Text(item['name']),
                          subtitle: Text(
                              '\$${item['price']} x ${item['quantity']} = \$${(item['price'] * item['quantity']).toStringAsFixed(2)}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () => Provider.of<CartModel>(context,
                                        listen: false)
                                    .removeItemFromCart(index),
                              ),
                              Text(item['quantity'].toString()),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () => Provider.of<CartModel>(context,
                                        listen: false)
                                    .addItemToCart(value.shopItems.indexWhere(
                                        (shopItem) =>
                                            shopItem[0] == item['name'])),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () => Provider.of<CartModel>(context,
                                        listen: false)
                                    .removeCompletelyFromCart(index),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Price",
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '\$${value.calculateTotal()}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          bool confirmed = await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Confirm Payment"),
                                content: Text(
                                    "Are you sure you want to proceed with the payment?"),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: Text("Cancel"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    child: Text("Confirm"),
                                  ),
                                ],
                              );
                            },
                          );

                          if (confirmed == true) {
                            // Perform payment logic here (e.g., API call or database update)

                            // Clear the cart
                            Provider.of<CartModel>(context, listen: false)
                                .clearCart();

                            // Show success message
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      "Order successful. Check your email for payment!")),
                            );
                          }
                        },
                        child: Text(
                          "Pay Now",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
