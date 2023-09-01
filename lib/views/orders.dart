import 'package:e_commerce_admin/controller/order_controller.dart';
import 'package:e_commerce_admin/model/order_model.dart';
import 'package:e_commerce_admin/views/order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../main.dart';

class Orders extends ConsumerWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(orderProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
      ),
      body: order.when(data: (data){
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            String formattedDate = DateFormat('d MMM, y').format(data[index].orderDate);
            String formattedTime = DateFormat('h.mm a').format(data[index].orderDate);
            String formatedDate = '$formattedDate || $formattedTime';

            return OrderCard(() {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>OrderDetails(order: data[index],)));
            },data[index],formatedDate);
        },);
      }, error: (err,stackTrace){
        return Text(err.toString());
      }, loading: (){
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
  OrderCard(VoidCallback navigate,OrderModel order,String formatedDate){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: navigate,
        child: Container(
          height: 140,
          width: mq.width,
          decoration: BoxDecoration(
            color: order.orderStatus == "Pending"
                ? Colors.greenAccent
                : order.orderStatus == "Accepted"
                    ? Colors.lightBlueAccent
                    : order.orderStatus == "Cancelled"
                        ? Colors.yellowAccent
                        : order.orderStatus == "Delivered"
                            ? Colors.tealAccent
                            : Colors.green,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text("Name: ",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15),),
                    Text(order.pName,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
                  ],
                ),
                Row(
                  children: [
                    Text("Price: ",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15),),
                    Text(order.price,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
                  ],
                ),
                Row(
                  children: [
                    Text("Quantity: ",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15),),
                    Text(order.quantity,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
                  ],
                ),
                Row(
                  children: [
                    Text("Order Date: ",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15),),
                    Text(formatedDate,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
                  ],
                ),
                Row(
                  children: [
                    Text("Order Status: ",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15),),
                    Text(order.orderStatus,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
