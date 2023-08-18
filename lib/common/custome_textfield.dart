// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTexField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  const CustomTexField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines=1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
        )),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
        )),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Emter Your $hintText';
        }

        return null;
      },
    );
  }
}
