// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon/Constants/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Stars extends StatelessWidget {
  final double rating;
  Stars({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      direction: Axis.horizontal,
       itemCount:5,
       rating: rating,
       itemSize: 15,
      itemBuilder: (context,_)=>const Icon(Icons.star,color: Golobal_variable.secondaryColor,),
      
     
      
    );
  }
}
