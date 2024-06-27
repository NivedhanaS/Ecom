import 'package:ecommerce_int2/constants/colors.dart';
import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(IconData icons, String hinttext, {String? errorText}) {
  return InputDecoration(
    hintText: hinttext,
    prefixIcon: Icon(icons, color: AppColor.header),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(color: Colors.green, width: 1.5),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        color: Colors.blue,
        width: 1.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        color: Colors.blue,
        width: 1.5,
      ),
    ),
    errorText: errorText,
  );
}
