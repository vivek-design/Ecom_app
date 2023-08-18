import 'package:amazon/Constants/global_variable.dart';
import 'package:amazon/Provider/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      decoration: const BoxDecoration(
        gradient: Golobal_variable.appBarGradient,
      ),

      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),

      //Richtext is to put multiple text in the same line
      child: Row(
       children:[ RichText(
            text:  TextSpan(
                text: 'Hello, ',
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
                children: [
              TextSpan(
                text: user.name,
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ])),

       ]
      ),
    );
  }
}
