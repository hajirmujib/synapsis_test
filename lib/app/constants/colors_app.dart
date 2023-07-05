import 'package:flutter/material.dart';

class AppColors {
  // Shimmer Colors
  static const Color shimmer = Color.fromARGB(255, 236, 243, 249);
  static const Color shimmerHiglight = Color.fromARGB(255, 246, 250, 255);

  static const Color elektrikRed = Color(0XFFEF0003);
  static const Color darkTangerine = Color(0XFFFFAE10);
  static const Color celticBlue = Color(0XFF2D7BD8);
  static const Color water = Color(0XFFD0E7FE);
  static const Color white = Color(0XFFFFFFFF);
  static const Color charlestonGreen = Color(0XFF2A2A2D);
  static const Color lavenderGray = Color(0XFFD0E7FE);
  static const Color maastrichtBlue = Color(0XFF0d2237);
  static const Color princetonOrange = Color(0XFFFF842B);

  static const MaterialColor black = MaterialColor(
    _blackPrimaryValue,
    <int, Color>{
      1: Color(0x03000000),
      2: Color(0x05000000),
      3: Color(0x08000000),
      4: Color(0x0A000000),
      5: Color(0x0D000000),
      6: Color(0x0F000000),
      7: Color(0x12000000),
      8: Color(0x14000000),
      10: Color(0x1A000000),
      20: Color(0x33000000),
      25: Color(0x40000000),
      50: Color(0x0A000000),
      100: Color(0x0F000000),
      200: Color(0x14000000),
      300: Color(0x29000000),
      400: Color(0x3D000000),
      500: Color(0x5C000000),
      600: Color(0x7A000000),
      700: Color(0xA3000000),
      800: Color(0xCC000000),
      900: Color(0xEB000000),
    },
  );
  static const int _blackPrimaryValue = 0xFF000000;

  static const MaterialColor gray = MaterialColor(
    _grayPrimaryValue,
    <int, Color>{
      10: Color(0xFFFAFAFA),
      50: Color(0xFFF7FAFC),
      100: Color(0xFFEDF2F7),
      200: Color(0xFFE2E8F0),
      300: Color(0xFFCBD5E0),
      400: Color(0xFFA0AEC0),
      500: Color(_grayPrimaryValue),
      600: Color(0xFF4A5568),
      700: Color(0xFF2D3748),
      800: Color(0xFF1A202C),
      900: Color(0xFF171923),
    },
  );
  static const int _grayPrimaryValue = 0xFF718096;
}
