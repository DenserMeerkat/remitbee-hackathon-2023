import 'package:flutter/material.dart';

UnderlineInputBorder inputBorder(String type, BuildContext context,
    {double? width, double radius = 8, Color? color}) {
  return UnderlineInputBorder(
    borderRadius: BorderRadius.circular(radius),
    borderSide: BorderSide(
      width: width ?? 0,
      color: Colors.transparent,
    ),
  );
}
