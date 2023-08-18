import 'package:amazon/Constants/global_variable.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CrouserImage extends StatefulWidget {
  const CrouserImage({super.key});

  @override
  State<CrouserImage> createState() => _CrouserImageState();
}

class _CrouserImageState extends State<CrouserImage> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(items: Golobal_variable.carouselImages.map((i) {
      return Builder(builder:  (BuildContext context) => Image.network(i,fit: BoxFit.cover,height: 200,));
    }).toList(), options: CarouselOptions(viewportFraction: 1,height: 200),
    
    );
  }
}
