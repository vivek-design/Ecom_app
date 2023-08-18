import 'package:amazon/Provider/userprovider.dart';
import 'package:amazon/home/widgets/address_box.dart';
import 'package:amazon/home/widgets/crousel_image.dart';
import 'package:amazon/home/widgets/deal_of_day.dart';
import 'package:amazon/home/widgets/top_categories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Constants/global_variable.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
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

            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                        height: 42,
                        margin: const EdgeInsets.only(left: 15,),
                        child: Material(
                          borderRadius: BorderRadius.circular(7),
                          elevation: 1,
                          child: TextFormField(
                            
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
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1)),
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
            children: [
              AddressBox(),
              SizedBox(
                height: 10,
              ),
              TopCatagories(),
              SizedBox(
                height: 10,
              ),
              CrouserImage(),
              DealOfDay(),
            ],
          ),
        ));
  }
}
