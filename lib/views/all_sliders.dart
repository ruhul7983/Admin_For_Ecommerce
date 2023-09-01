import 'dart:io';

import 'package:e_commerce_admin/controller/slider_controller.dart';
import 'package:e_commerce_admin/repository/slider_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AllSliders extends ConsumerStatefulWidget {
  const AllSliders({super.key});

  @override
  ConsumerState<AllSliders> createState() => _AllSlidersState();
}

class _AllSlidersState extends ConsumerState<AllSliders> {
  File? selectedImages; // Changed var to XFile

  Future<void> selectImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? pickedImages = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImages != null) {
      setState(() {
        selectedImages = File(pickedImages.path);
      });
    }
  }

  TextEditingController campaignName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final sliders = ref.watch(sliderProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("All Sliders"),
        actions: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 500,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(children: [
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: campaignName,
                          decoration: InputDecoration(
                              labelText: "Campaign Name",
                              hintText: "Enter Campaign Name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        ElevatedButton(
                            onPressed: selectImage,
                            child: Text("Select Image")),
                        ElevatedButton(
                            onPressed: () {
                              SliderRepository().postSlider(
                                  campaignName.text, selectedImages as File);
                            },
                            child: Text("Post Slider")),
                      ]),
                    ),
                  );
                },
              );
            },
            child: Row(
              children: [
                Text("Add New Campaign "),
                Icon(Icons.add),
              ],
            ),
          ),
        ],
      ),
      body: sliders.when(data: (data) {
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.lightBlueAccent,
                ),
                child: Column(children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      image: DecorationImage(
                          image: NetworkImage(data[index].imageUrl),
                          fit: BoxFit.fitWidth),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data[index].campaignName,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          SliderRepository().deleteSlider(data[index].docId);
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            );
          },
        );
      }, error: (err, stack) {
        return Text(err.toString());
      }, loading: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
