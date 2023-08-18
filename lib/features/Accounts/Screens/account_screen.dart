import 'package:amazon/Constants/global_variable.dart';
import 'package:amazon/features/Accounts/Widgets/orders.dart';
import 'package:amazon/features/Accounts/Widgets/top_buttons.dart';
import 'package:flutter/material.dart';

import '../Widgets/below_app_bar.dart';
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          //we do not have gradient feature in appbar 
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: Golobal_variable.appBarGradient,
            ),
          ),

          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            children: [
           
            Container(
              alignment: Alignment.topLeft,
              child:Image.asset('assets/Images/amazon_in.png',
              width: 120,
              height: 45,
              color:Colors.black)
            ),

            Container(
              padding: const EdgeInsets.only(left: 15,right:15,),
              child: Row(children: [
                Padding(
                  padding: EdgeInsets.only(right:15),
                  child: Icon(Icons.notification_add_outlined),
                  
                ),


                 Padding(
                  padding: EdgeInsets.only(right:15),
                  child: Icon(Icons.search),
                  
                )
              ]),
              
              )
          ]),
        ),
      ),
      body: Column(
            children:[
                   BelowAppBar(),
                   SizedBox(height: 10,),
                   TopButtons(),
                   SizedBox(height: 20,),
                   Orders(),
                   
            ]
      )
    );
  }
}