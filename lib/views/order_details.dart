import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:e_commerce_admin/main.dart';
import 'package:e_commerce_admin/model/order_model.dart';
import 'package:e_commerce_admin/repository/order_repository.dart';
import 'package:e_commerce_admin/repository/pdf_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../helper/pdf_helper.dart';
import '../helper/pdf_invoice_helper.dart';
import '../model/customer.dart';
import '../model/invoice.dart';
import '../model/supplier.dart';

class OrderDetails extends StatefulWidget {
  final OrderModel order;
  OrderDetails({super.key, required this.order});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final List<String> orderStatus = [
    "Pending",
    "Accepted",
    "Shipped",
    "Delivered"
  ];

  String? selectedOrderStatus;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: mq.height * 0.15,
              width: mq.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade400,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Row(
                    children: [
                      Text(
                        "Customer Name: ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.order.uName,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Order Date: ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat('d MMM, y').format(widget.order.orderDate),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: "Loaction: ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                text: widget.order.uLocation +
                                    ", " +
                                    widget.order.uPs +
                                    ", " +
                                    widget.order.uDistrict +
                                    ", " +
                                    widget.order.uDistrict,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
            Text(
              "Item",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Card(
              child: ListTile(
                leading: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.network(widget.order.imageUrl),
                ),
                title: Text(
                  widget.order.pName,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text("Size: " + widget.order.size),
                trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Quantity: " + widget.order.quantity),
                      Text("Total Price: " + widget.order.totalPrice),
                    ]),
              ),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Text(
                  'Update order status',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                items: orderStatus
                    .map((String categories) => DropdownMenuItem<String>(
                          value: categories,
                          child: Text(
                            categories,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                value: selectedOrderStatus,
                onChanged: (String? value) {
                  setState(() {
                    selectedOrderStatus = value;
                  });
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 40,
                  width: double.infinity,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await OrderRepository()
                    .updateOrderStatus(widget.order.oId, selectedOrderStatus!)
                    .then((value) => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text("Upadated to ${selectedOrderStatus}"))));
              },
              child: Text("Update Order Satus"),
            ),
            ElevatedButton(
                onPressed: () async {
                  final date = DateTime.now();
                  final dueDate = date.add(
                    const Duration(days: 7),
                  );
                  final invoice = Invoice(
                    supplier: const Supplier(
                      name: 'Faysal Neowaz',
                      address: 'Dhaka, Bangladesh',
                      paymentInfo: 'https://paypal.me/codespec',
                    ),
                    customer: const Customer(
                      name: 'Google',
                      address: 'Mountain View, California, United States',
                    ),
                    info: InvoiceInfo(
                      date: date,
                      dueDate: dueDate,
                      description: 'First Order Invoice',
                      number: '${DateTime.now().year}-9999',
                    ),
                    items: [
                      InvoiceItem(
                        description: 'Coffee',
                        date: DateTime.now(),
                        quantity: 3,
                        vat: 0.19,
                        unitPrice: 5.99,
                      ),
                      InvoiceItem(
                        description: 'Water',
                        date: DateTime.now(),
                        quantity: 8,
                        vat: 0.19,
                        unitPrice: 0.99,
                      ),
                      InvoiceItem(
                        description: 'Orange',
                        date: DateTime.now(),
                        quantity: 3,
                        vat: 0.19,
                        unitPrice: 2.99,
                      ),
                      InvoiceItem(
                        description: 'Apple',
                        date: DateTime.now(),
                        quantity: 8,
                        vat: 0.19,
                        unitPrice: 3.99,
                      ),
                      InvoiceItem(
                        description: 'Mango',
                        date: DateTime.now(),
                        quantity: 1,
                        vat: 0.19,
                        unitPrice: 1.59,
                      ),
                      InvoiceItem(
                        description: 'Blue Berries',
                        date: DateTime.now(),
                        quantity: 5,
                        vat: 0.19,
                        unitPrice: 0.99,
                      ),
                      InvoiceItem(
                        description: 'Lemon',
                        date: DateTime.now(),
                        quantity: 4,
                        vat: 0.19,
                        unitPrice: 1.29,
                      ),
                    ],
                  );

                  final pdfFile = await PdfInvoicePdfHelper.generate(invoice);

                  PdfHelper.openFile(pdfFile);
                },
                child: Text("Generate PDF"))
          ],
        ),
      ),
    );
  }
}
