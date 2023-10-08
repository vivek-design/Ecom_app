// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon/Models/product.dart';
import 'package:amazon/features/Product_details/screens/product_details.dart';
import 'package:amazon/home/screens/Services/home_services.dart';
import 'package:flutter/material.dart';

import 'package:amazon/Constants/global_variable.dart';

class CategoryDealsScreen extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryDealsScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryDealsScreen> createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {
  List<Product>? productlist;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    productlist = await homeServices.fetchCategoryProducts(
        context: context, category: widget.category);

    setState(() {});
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

          title: Text(
            widget.category,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: productlist == null
          ? const CircularProgressIndicator.adaptive()
          : Column(children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                alignment: Alignment.topLeft,
                child: Text(
                  'Keep shopping for ${widget.category}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 170,
                child: GridView.builder(
                    itemCount: productlist!.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 15),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1.4,
                        mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      final product = productlist![index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, ProductDetailScreen.routeName,arguments: product);
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 130,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  color: Colors.black12,
                                  width: 0.5,
                                )),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.network(product.images[0]),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.only(
                                  left: 0, top: 5, right: 15),
                              child: Text(
                                product.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              )
            ]),
    );
  }
}
