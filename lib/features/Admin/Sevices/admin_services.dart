import 'dart:io';

import 'package:amazon/Constants/utils.dart';
import 'package:flutter/material.dart';

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
    try {
      
    } catch (e) {
      showsnackBar(context, e.toString());
    }
  }
}
