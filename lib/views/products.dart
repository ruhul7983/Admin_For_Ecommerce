import 'package:e_commerce_admin/controller/product_controller.dart';
import 'package:e_commerce_admin/repository/product_repository.dart';
import 'package:e_commerce_admin/views/edit_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Products extends ConsumerWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: products.when(data: (data){
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>EditProduct(price: data[index].price, productId: data[index].productId)));
            },
            child: Card(
              child: ListTile(
                title: Text(data[index].name,maxLines: 2,style: TextStyle(fontWeight: FontWeight.w700),),
                subtitle: Text("৳${data[index].price}"),
                leading: ClipRect(
                  child: Image.network(data[index].image[0]),
                ),
                trailing: GestureDetector(
                    onTap: (){
                      ProductRepository().deleteProduct(data[index].productId);
                    },
                    child: Icon(Icons.remove_circle_outline,color: Colors.red,)),
              ),
            ),
          );
        },);
      }, error: (err,stackTrace){
        return Text(err.toString());
      }, loading: (){
        return Center(child: CircularProgressIndicator(),);
      }),
    );
  }
}
