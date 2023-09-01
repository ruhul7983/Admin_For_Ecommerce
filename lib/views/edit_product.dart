import 'package:e_commerce_admin/repository/product_repository.dart';
import 'package:flutter/material.dart';

class EditProduct extends StatefulWidget {
  final String price;
  final String productId;
  EditProduct({super.key, required this.price, required this.productId});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                label: Text("Price"),
                hintText: widget.price,
              ),
              controller: priceController,
            ),
            ElevatedButton(onPressed: (){
              if(priceController.text != ""){
                ProductRepository().updatePrice(widget.productId, priceController.text);
                priceController.text = "";
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Updated Successfully")));
              }else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter Update Price")));
              }
            }, child: Text("Update Price"),),
          ],
        ),
      ),
    );
  }
}
