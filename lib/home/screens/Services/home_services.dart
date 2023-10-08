import 'dart:convert';

import 'package:amazon/Constants/errror_handling.dart';
import 'package:amazon/Constants/global_variable.dart';
import 'package:amazon/Constants/utils.dart';
import 'package:amazon/Models/product.dart';
import 'package:amazon/Provider/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import 'package:provider/provider.dart';

class HomeServices{
   
   Future<List<Product>>fetchCategoryProducts({required BuildContext context,required String category}) async {
        
         final userProvider = Provider.of<UserProvider>(context);

          List<Product> productList = [];

    try {
      http.Response response =
          await http.get(Uri.parse('$uri/api/products?category=$category'), headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(response.body).length(); i++) {
              productList.add(Product.fromJson(jsonEncode(
                jsonDecode( response.body)[i],
              )));
            }
          });
    } catch (e) {
      showsnackBar(context, e.toString());
    }

    return productList;

   }

}