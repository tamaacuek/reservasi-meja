import 'package:flutter/material.dart';

class ListProduct extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  final VoidCallback? onPressed; // Untuk tombol harga
  final VoidCallback? onContainerTap; // Untuk tap di luar tombol

  const ListProduct(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.imagePath,
      required this.color,
      required this.onPressed,
      required this.onContainerTap,
    });

 @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque, // Tangkap event di seluruh area
        onTap: onContainerTap,
        child: Container(
          decoration: BoxDecoration(
            color: color[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Gambar
              Image.asset(
                imagePath,
                height: 90,
              ),
              // Nama item
              Text(itemName, textAlign: TextAlign.center, style: TextStyle(fontSize: 16),),
              // Tombol harga
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
            ],
          ),
        ),
      ),
    );
  }
}
