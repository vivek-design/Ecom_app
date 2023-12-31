import 'package:flutter/material.dart';


class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding:const EdgeInsets.only(left:10 ),
          child: Text('Deal of the day',style: TextStyle(fontSize: 20),),
    
            
        ),


          Image.network('https://images.unsplash.com/photo-1691585009424-dd6ab3f0ce46?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
          height: 235,
          fit: BoxFit.fitHeight),
          
          Container(
               alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left:15),
            child: Text('\$100',style: TextStyle(fontSize: 18),),
          ),

          Container(
               alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left:15,top:5,right:40),
            child: Text('Vaibhav',maxLines: 2,overflow: TextOverflow.ellipsis,),
          ),


          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 
                 Image.network('https://plus.unsplash.com/premium_photo-1691787289300-cbdbeffdff9d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyN3x8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',fit: BoxFit.fitWidth,width: 100,height: 100,),
                 Image.network('https://plus.unsplash.com/premium_photo-1691787289300-cbdbeffdff9d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyN3x8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',fit: BoxFit.fitWidth,width: 100,height: 100,),
                 Image.network('https://plus.unsplash.com/premium_photo-1691787289300-cbdbeffdff9d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyN3x8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',fit: BoxFit.fitWidth,width: 100,height: 100,),
                 Image.network('https://plus.unsplash.com/premium_photo-1691787289300-cbdbeffdff9d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyN3x8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',fit: BoxFit.fitWidth,width: 100,height: 100,),
          
              ],),
          ),

          Container(
            padding: EdgeInsets.symmetric(
              vertical: 15
            ).copyWith(left:15),
            alignment: Alignment.topLeft,
            child: Text('See all deals',style:TextStyle(
              color: Colors.cyan[800],
            )),

          )
      ],

    
    );
  }
}