import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static ThemeData LightTheme = ThemeData(
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.elMessiri(
        fontSize: 18.sp,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      ),
      bodySmall: GoogleFonts.elMessiri(
        fontSize: 16.sp,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      ),
    ),
  );
}
