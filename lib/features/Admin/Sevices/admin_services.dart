import 'dart:convert';
import 'dart:io';
import 'package:amazon/Constants/errror_handling.dart';
import 'package:amazon/Provider/userprovider.dart';
import 'package:http/http.dart' as http;
import 'package:amazon/Constants/utils.dart';
import 'package:amazon/Models/product.dart';
import 'package:cloudinary_public/cloudinary_public.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Constants/global_variable.dart';
import '../../../Provider/userprovider.dart';

class AdminService {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic('di1f0qshw', 'sxuj5qzc');
      List<String> imageUrls = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse response = await cloudinary.uploadFile(
            CloudinaryFile.fromFile(images[i].path,
                resourceType: CloudinaryResourceType.Image));
        imageUrls.add(response.secureUrl);
      }

      Product product = Product(
          name: name,
          description: description,
          quantity: quantity,
          images: imageUrls,
          category: category,
          price: price);

      http.Response res = await http.post(Uri.parse('$uri/admin/add-product'),
          headers: {
            'Content-Type': 'application/json; charset=utf-8',
            'x-auth-token': userProvider.user.token,
          },
          body: product.toJson());

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showsnackBar(context, 'Product Added Successfully !');
            Navigator.pop(context);
          });
    } catch (e) {
      showsnackBar(context, e.toString());
    }
  }

  Future<List<Product>> getAllProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context);

    List<Product> productList = [];

    try {
      http.Response response =
          await http.get(Uri.parse('$uri/admin/delete-product'), headers: {
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

  void deleteProduct(
      {required BuildContext context,
      required Product product,
      required VoidCallback onSuccess}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(Uri.parse('$uri/admin/add-product'),
          headers: {
            'Content-Type': 'application/json; charset=utf-8',
            'x-auth-token': userProvider.user.token,
          },
          body: jsonEncode({
            'id': product.id,
          }));

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            onSuccess();
          });
    } catch (e) {
      showsnackBar(context, e.toString());
    }
  }
}
