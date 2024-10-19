import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
 final String? text;
 final Color? color;
 final double? fontSize;
 final FontWeight? fontWeight;

 const MyText(
     this.text, {
      Key? key,
       this.color,
      this.fontSize,
      this.fontWeight,
     }) : super(key: key);

 @override
 Widget build(BuildContext context) {
  return Text(
   text ?? '', // Use the provided text, or an empty string if it's null.
   style: TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
   ),
  );
 }
}