import 'package:flutter/material.dart';

class CrText extends StatelessWidget {
  // For entered text
  final String text;
  // For entered size
  final double? size;
  //For Weight of font
  final FontWeight? weight;
  // For Font Color
  final Color? color;
  // For Fontfamily
  final String? family;
  // For styling the text
  final TextStyle? style;
  // For avoid over flow maybe
  final TextOverflow? overflow;
  // For max line
  final int? maxlines;

  const CrText({
    Key? key,
    this.maxlines,
    this.style,
    this.overflow,
    required this.text,
    this.color,
    this.size,
    this.family,
    this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxlines,
      overflow: overflow,
      style: style ??
          TextStyle(
            color: color ?? Colors.white,
            fontSize: size ?? 14,
            fontFamily: family,
            fontWeight: weight ?? FontWeight.w500,
          ),
    );
  }
}