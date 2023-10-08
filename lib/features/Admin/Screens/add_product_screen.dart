import 'dart:io';

import 'package:amazon/Constants/utils.dart';
import 'package:amazon/common/custome_textfield.dart';
import 'package:amazon/features/Admin/Sevices/admin_services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../Constants/global_variable.dart';
import '../../../common/custome_button.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final AdminService adminService = AdminService();
  @override
  void dispose() {
    super.dispose();

    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  String category = "Mobiles";

  List<File> images = [];

  final _addproductFormKey = GlobalKey<FormState>();

  List<String> productCategories = [
    "Mobiles",
    "Appliance",
    "Essentials",
    "Books",
    "Fashion"
  ];

  void sellProduct() {
    if (_addproductFormKey.currentState!.validate() && images.isNotEmpty) {
      adminService.sellProduct(
          context: context,
          name: productNameController.text,
          description: descriptionController.text,
          price: double.parse(priceController.text),
          quantity: double.parse(quantityController.text),
          category: category,
          images: images);
    }
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          //we do not have gradient feature in appbar
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: Golobal_variable.appBarGradient,
            ),
          ),

          title: const Text(
            "Add Producct",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _addproductFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  images.isNotEmpty
                      ? CarouselSlider(
                          items: images.map((i) {
                            return Builder(
                                builder: (BuildContext context) => Image.file(
                                      i,
                                      fit: BoxFit.cover,
                                      height: 200,
                                    ));
                          }).toList(),
                          options:
                              CarouselOptions(viewportFraction: 1, height: 200),
                        )
                      : GestureDetector(
                          onTap: () => selectImages(),
                          child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(10),
                              dashPattern: [10, 4],
                              strokeCap: StrokeCap.round,
                              child: Container(
                                width: double.infinity,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.folder_open,
                                      size: 40,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Select Product Images',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[400]),
                                    )
                                  ],
                                ),
                              )),
                        ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTexField(
                      controller: productNameController,
                      hintText: "Product Name"),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTexField(
                      controller: descriptionController,
                      hintText: "Description",
                      maxLines: 7),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTexField(
                      controller: priceController, hintText: "Price"),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTexField(
                      controller: quantityController, hintText: "Quantity"),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButton(
                      value: category,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: productCategories.map((String s) {
                        return DropdownMenuItem(value: s, child: Text(s));
                      }).toList(),
                      onChanged: (String? newVal) {
                        setState(() {
                          category = newVal!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    text: "Sell",
                    onTap: () {
                      sellProduct();
                      
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
