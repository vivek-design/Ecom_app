// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon/Models/product.dart';
import 'package:amazon/common/custome_button.dart';
import 'package:amazon/common/stars.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:amazon/Constants/global_variable.dart';
import 'package:amazon/home/Search/screens/search_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String routeName = "/product-details";
  final Product product;

  ProductDetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          //we do not have gradient feature in appbar
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: Golobal_variable.appBarGradient,
            ),
          ),

          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Expanded(
              child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 23,
                                )),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(7),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1)),
                          hintText: 'Search Amazon.in',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          )),
                    ),
                  )),
            ),
            Container(
              color: Colors.transparent,
              height: 42,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.mic,
                color: Colors.black,
                size: 23,
              ),
            )
          ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.id!,
                  ),
                  Stars(rating: 4),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: Text(
                widget.product.name,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            CarouselSlider(
              items: widget.product.images.map((i) {
                return Builder(
                    builder: (BuildContext context) => Image.network(
                          i,
                          fit: BoxFit.cover,
                          height: 200,
                        ));
              }).toList(),
              options: CarouselOptions(viewportFraction: 1, height: 300),
            ),
            Container(
              color: Colors.black12,
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                  text: TextSpan(
                      text: "Deal Price   ",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      children: [
                    TextSpan(
                      text: "\$ ${widget.product.price} ",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.red,
                          fontWeight: FontWeight.w500),
                    ),
                  ])),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(widget.product.description),
            ),

            Container(
              color: Colors.black12,
              height: 5,
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomButton(text: "Buy Now", onTap: (){
                   
              }),

              
            ),

            
            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomButton(text: "Add to cart", onTap: (){
                   
              },
              color: Color.fromRGBO(254,216,19,1),),
              
              
            ),
          ],
        ),
      ),
    );
  }
}
