import 'package:e_commerce_admin/views/add_product.dart';
import 'package:e_commerce_admin/views/all_sliders.dart';
import 'package:e_commerce_admin/views/all_users.dart';
import 'package:e_commerce_admin/views/orders.dart';
import 'package:e_commerce_admin/views/products.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          right: 8.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Wrap(
                children: [
                  CustomContainer(() {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Products()));
                  }, Icon(Icons.shop_2_outlined), "Products",
                      Colors.greenAccent),
                  CustomContainer(() {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Orders()));
                  }, Icon(Icons.card_travel), "Orders", Colors.yellowAccent),
                  CustomContainer(() {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => AllUsers()));
                  }, Icon(Icons.person), "Users", Colors.lightBlueAccent),
                  CustomContainer(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => AllSliders()));
                  }, Icon(Icons.image), "Slider", Colors.tealAccent),
                  CustomContainer(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => AddProduct()));
                  }, Icon(Icons.laptop_chromebook_outlined), "Add Product",
                      Colors.purpleAccent),
                  CustomContainer(() {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Cuurently Unavailable")));
                  }, Icon(Icons.sell), "Sales Report", Colors.amber),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  CustomContainer(
    VoidCallback navigate,
    Icon icon,
    String text,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, top: 8.0),
      child: GestureDetector(
        onTap: navigate,
        child: Container(
          height: mq.height * 0.25,
          width: mq.width / 2.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                Text(
                  text,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
