import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics_admin_panel/utils/app_colors.dart';

ThemeData buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
    textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme),
    scaffoldBackgroundColor: kSecondaryColor,
    appBarTheme: const AppBarTheme(backgroundColor: kSecondaryColor),
    colorScheme: ThemeData().colorScheme.copyWith(primary: kPrimaryColor),
  );
}
