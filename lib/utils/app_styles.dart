import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'app_colors.dart';

class AppStyles {
  static TextStyle whiteTextStyle() => GoogleFonts.lato(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: kWhiteColor,
  );
  static TextStyle blackTextStyle() => GoogleFonts.lato(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: kBlackColor,
  );
}

double getWidth(double pixelValue) {
  double baseScreenWidth = 1440.0;
  return (pixelValue / baseScreenWidth) * 100.w;
}

double getHeight(double pixelValue) {
  double baseScreenHeight = 1024.0;
  return (pixelValue / baseScreenHeight) * 100.h;
}
