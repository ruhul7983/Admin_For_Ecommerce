import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:e_commerce_admin/repository/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../main.dart';
import 'common_widget/add_product_text_form.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

final List<String> items = [
  "7 days easy return",
  "14 days easy return",
  "Return not possible"
];
String? selectedReturnPolicy;
final List<String> postType = [
  "Hot Selling",
  "Summer Sale",
  "Winter Sale",
  "Free Shipping"
];
final List<String> categories = [
  "Electronics",
  "Fashion",
  "Appliance",
  "Beauty"
];
String? selectedPostType;
String? selectedCategories;

bool isLoading = false;

bool? selectedCodType;

class _AddProductState extends State<AddProduct> {
  List<TextEditingController> sizeControllers =
      []; // Controllers for size input fields

  void addSizeField() {
    setState(() {
      sizeControllers.add(
          TextEditingController()); // Add controller for the new size field
    });
  }

  List<String> selectedImages = [];

  Future<void> selectImage() async {
    final ImagePicker _picker = ImagePicker();
    List<XFile>? pickedImages = await _picker.pickMultiImage();

    if (pickedImages != null) {
      setState(() {
        selectedImages = pickedImages.map((image) => image.path).toList();
      });
    }
  }

  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionCrontroller = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController originalPriceController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController stockController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Product"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AddProductTextForm(
                    label: "Add Product",
                    hint: "Product Name",
                    controller: productNameController),
                AddProductTextForm(
                  label: "Description",
                  hint: "Description",
                  maxLine: 5,
                  controller: descriptionCrontroller,
                ),
                AddProductTextForm(
                    label: "Brand Name",
                    hint: "Nike",
                    controller: brandNameController),
                AddProductTextForm(
                    label: "Original Price",
                    hint: "৳800",
                    controller: originalPriceController),
                AddProductTextForm(
                    label: "Sell Price",
                    hint: "৳600",
                    controller: priceController),
                AddProductTextForm(
                    label: "Stock", hint: "20", controller: stockController),
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      'Select Return Policy',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    items: items
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: selectedReturnPolicy,
                    onChanged: (String? value) {
                      setState(() {
                        selectedReturnPolicy = value;
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
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      'Select Post Type',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    items: postType
                        .map((String postType) => DropdownMenuItem<String>(
                              value: postType,
                              child: Text(
                                postType,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: selectedPostType,
                    onChanged: (String? value) {
                      setState(() {
                        selectedPostType = value;
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
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      'Select Categories',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    items: categories
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
                    value: selectedCategories,
                    onChanged: (String? value) {
                      setState(() {
                        selectedCategories = value;
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

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Select Payment Type: ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    Row(
                      children: [
                        Text("Cash on Delivery available"),
                        Radio<bool>(
                          value: true,
                          groupValue: selectedCodType,
                          onChanged: (bool? newValue) {
                            setState(() {
                              selectedCodType = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Online Payment"),
                        Radio<bool>(
                          value: false,
                          groupValue: selectedCodType,
                          onChanged: (bool? newValue) {
                            setState(() {
                              selectedCodType = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                //select size with check box
                Text(
                  "Add Size: ",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                Column(
                  children: sizeControllers.map((controller) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        controller: controller,
                        decoration: InputDecoration(
                          labelText: 'Size',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                ElevatedButton(
                    onPressed: addSizeField, child: Text("Add new size")),

                //select image
                Text(
                  "Select Image: ",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                ElevatedButton(
                    onPressed: selectImage,
                    child: Text("Select Multiple Image")),
                GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Adjust as needed
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: selectedImages.length,
                  itemBuilder: (context, index) {
                    return Image.file(File(selectedImages[index]));
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });
                    if (selectedImages != [] ||
                        productNameController.text.isNotEmpty ||
                        selectedCodType != null ||
                        brandNameController.text.isNotEmpty ||
                        originalPriceController.text.isNotEmpty ||
                        priceController.text.isNotEmpty ||
                        selectedCategories != null ||
                        stockController.text.isNotEmpty ||
                        selectedReturnPolicy != null ||
                        selectedPostType != null) {
                      await ProductRepository()
                          .postProduct(
                            selectedImages,
                            productNameController.text,
                            selectedCodType as bool,
                            brandNameController.text,
                            sizeControllers.toList(),
                            originalPriceController.text,
                            priceController.text,
                            descriptionCrontroller.text,
                            selectedCategories!,
                            stockController.text,
                            selectedReturnPolicy!,
                            "65",
                            selectedPostType!,
                          )
                          .then((value) => ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                                  content: Text("Posted Successfully"))));
                      setState(() {
                        isLoading = false;
                      });
                    } else {
                      setState(() {
                        isLoading = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Value is not empty")));
                    }
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.circular(10)),
                    child: isLoading
                        ? Center(child: CircularProgressIndicator())
                        : Center(
                            child: Text(
                            "Post Product",
                            style: TextStyle(color: Colors.black),
                          )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
