import 'package:flutter/material.dart';
import 'package:tama_app/pages/cart_page.dart';

class ProductDetailPage extends StatelessWidget {
  final String itemName;
  final List<String> imagePaths;
  final String description;
  final String itemPrice;
  final MaterialColor color;
  final VoidCallback? onPressed;

  const ProductDetailPage({
    super.key,
    required this.itemName,
    required this.imagePaths,
    required this.description,
    required this.itemPrice,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CartPage();
        })),
        backgroundColor: Colors.white,
        child: Icon(Icons.shopping_bag),
      ),
      appBar: AppBar(
        title: Text(
          itemName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: color[100],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 250,
                child: PageView.builder(
                  itemCount: imagePaths.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      imagePaths[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              SizedBox(height: 15),
              Text(
                itemName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  description,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 5),
              // Text("Note: Harga yang tertera adalah per 10 pcs switch."),
              SizedBox(height: 10),
              MaterialButton(
                onPressed: onPressed,
                color: color[800],
                child: Text(
                  '\$$itemPrice',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
