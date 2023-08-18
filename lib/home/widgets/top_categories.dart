import 'package:amazon/Constants/global_variable.dart';
import 'package:flutter/material.dart';

class TopCatagories extends StatelessWidget {
  const TopCatagories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        //to provide spacing between eacch and every element
        itemExtent: 75,
        itemBuilder: (context, index) {
        
          return Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(Golobal_variable.categoryImages[index]['image']!,
                  fit: BoxFit.cover,
                  height: 40,
                  width: 40,
                  ),
                  
                ),
              ),
              Text(Golobal_variable.categoryImages[index]['title']!
              ,style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,

                
              ),
              
              ),


            ],
          );
        },
        itemCount: Golobal_variable.categoryImages.length,
      ),
    );
  }
}
