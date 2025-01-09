import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:tama_app/component/drawer.dart';
import 'package:tama_app/component/list_product.dart';
import 'package:tama_app/model/cart_model.dart';
import 'package:tama_app/pages/ProductDetailPage.dart';
import 'package:tama_app/pages/cart_page.dart';
import 'package:tama_app/pages/profile.dart';
import 'loginPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  // navigate to profile page
  void goToProfilePage(BuildContext context) {
    // pop menu drawer
    Navigator.pop(context);

    // go to profile page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfilePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CartPage();
        })),
        backgroundColor: Colors.white,
        child: Icon(
          Icons.shopping_bag,
          color: Colors.grey[800],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: const Text(
          // "Supernelav",
          "Omah Kayu",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        // leading: IconButton(
        //   icon: const Icon(Icons.account_circle_outlined),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => const ProfilePage()),
        //     );
        //   },
        // ),
      ),
      drawer: MyDrawer(
        onProfileTap: () => goToProfilePage(context),
        onSignOut: () => _logout(context),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Welcome,"),
            ),
            const SizedBox(height: 4),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                // "The widest selection of switches at the best prices. Exclusively at Supernelav.",
                "the best reservation offer is only at \n Omah Kayu",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 4),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Table List",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Expanded(
              child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: value.shopItems.length,
                    padding: EdgeInsets.all(12.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                    ),
                    itemBuilder: (context, index) {
                      return ListProduct(
                        itemName: value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        // Ambil gambar pertama dari daftar gambar
                        imagePath: value.shopItems[index][2][0],
                        color: value.shopItems[index][3],
                        onContainerTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailPage(
                                itemName: value.shopItems[index][0],
                                itemPrice: value.shopItems[index][1],
                                imagePaths: value.shopItems[index]
                                    [2], // Kirim seluruh daftar gambar
                                color: value.shopItems[index][3],
                                description: value.shopItems[index][4],
                                onPressed: () {
                                  // Tambahkan item ke cart
                                  Provider.of<CartModel>(context, listen: false)
                                      .addItemToCart(index);
                                },
                              ),
                            ),
                          );
                        },
                        onPressed: () {
                          // Tambahkan item ke cart
                          Provider.of<CartModel>(context, listen: false)
                              .addItemToCart(index);
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
