import 'package:admin_dashboard/app/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final double? letterSpacing;
  final double? height;
  final Color? color;
  final Color? decorationColor;
  final FontWeight? weight;
  final TextAlign? align;
  final TextStyle? textStyle;
  final TextDecoration? decoration;
  final int? maxLines;
  final String? font;
  final bool isItalic;
  final TextOverflow? overflow;

  const CustomText({
    super.key,
    required this.text,
    this.decorationColor,
    this.size,
    this.color,
    this.weight,
    this.align,
    this.maxLines,
    this.decoration,
    this.font,
    this.letterSpacing,
    this.overflow,
    this.isItalic = false,
    this.textStyle,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align ?? TextAlign.start,
      maxLines: maxLines,
      softWrap: true,
      overflow: overflow,
      style:
          textStyle ??
          GoogleFonts.lexend(
            height: height ?? 1.1,
            decorationColor: decorationColor ?? Colors.transparent,
            letterSpacing: letterSpacing ?? 0,
            fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
            fontSize: size?.sp ?? 16.sp,
            decoration: decoration ?? TextDecoration.none,
            color: appBackgroundColor(
              darkColor: Colors.white,
              lightColor: Colors.black,
            ),
            fontWeight: weight ?? FontWeight.normal,
          ),
    );
  }
}
