// ignore: implementation_imports
import 'dart:ui';

import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter_applications/colors/dimensions.dart';

class BigText extends StatelessWidget {
  BigText(
      {super.key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.size = 0,
      this.overFlow = TextOverflow.ellipsis});
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
          fontFamily: "Roboto",
          color: color,
          fontSize: size==0 ?Dimensions.font20:size,
          fontWeight: FontWeight.bold),
    );
  }
}
