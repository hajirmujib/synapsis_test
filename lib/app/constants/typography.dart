import 'package:catatan/app/constants/colors_app.dart';
import 'package:flutter/widgets.dart';

class AppTypography {
  static String? package;

  static get getPackage => package == null ? 'viva_ui' : null;

  static TextStyle appBarTitle = TextStyle(
    fontSize: 16,
    color: AppColors.charlestonGreen,
    fontWeight: FontWeight.w700,
    fontFamily: 'Nunito',
    package: getPackage,
  );

  // re-format Typoghrapy
  static TextStyle heading1 = TextStyle(
    fontSize: 56,
    fontWeight: FontWeight.w700,
    color: AppColors.charlestonGreen,
    fontFamily: 'Nunito',
    package: getPackage,
  );

  static TextStyle heading2 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    color: AppColors.charlestonGreen,
    fontFamily: 'Nunito',
    package: getPackage,
  );

  static TextStyle heading3 = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w600,
    color: AppColors.charlestonGreen,
    fontFamily: 'Nunito',
    package: getPackage,
  );

  static TextStyle heading4 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.charlestonGreen,
    fontFamily: 'Nunito',
    package: getPackage,
  );

  static TextStyle heading5 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.charlestonGreen,
    fontFamily: 'Nunito',
    package: getPackage,
  );

  static TextStyle heading6 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.charlestonGreen,
    fontFamily: 'Nunito',
    package: getPackage,
  );

  static TextStyle largeRegular = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.charlestonGreen,
    fontFamily: 'Nunito',
    package: getPackage,
  );

  static TextStyle largeBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.charlestonGreen,
    fontFamily: 'Nunito',
    package: getPackage,
  );

  static TextStyle mediumRegular = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.charlestonGreen,
    fontFamily: 'Nunito',
    package: getPackage,
  );

  static TextStyle mediumMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.charlestonGreen,
    fontFamily: 'Nunito',
    package: getPackage,
  );

  static TextStyle mediumBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.charlestonGreen,
    fontFamily: 'Nunito',
    package: getPackage,
  );

  static TextStyle normalRegular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.charlestonGreen,
    fontFamily: 'Nunito',
    package: getPackage,
  );

  static TextStyle normalMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.charlestonGreen,
    fontFamily: 'Nunito',
    package: getPackage,
  );

  static TextStyle normalBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.charlestonGreen,
    fontFamily: 'Nunito',
    package: getPackage,
  );

  static TextStyle smallRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.charlestonGreen,
    fontFamily: 'Nunito',
    package: getPackage,
  );

  static TextStyle smallMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.charlestonGreen,
    fontFamily: 'Nunito',
    package: getPackage,
  );

  static TextStyle smallSemiBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.charlestonGreen,
    fontFamily: 'Nunito',
    package: getPackage,
  );

  static TextStyle smallBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.charlestonGreen,
    fontFamily: 'Nunito',
    package: getPackage,
  );

  static TextStyle textLink = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.charlestonGreen,
    fontFamily: 'Nunito',
    package: getPackage,
  );

  static TextStyle extraSmallRegular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.charlestonGreen,
    fontFamily: 'Nunito',
    package: getPackage,
  );
  static TextStyle veryExtraSmallRegular = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.charlestonGreen,
    fontFamily: 'Nunito',
    package: getPackage,
  );
  static TextStyle veryExtraSmallBold = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    color: AppColors.charlestonGreen,
    fontFamily: 'Nunito',
    package: getPackage,
  );

  static TextStyle extraSmallMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.charlestonGreen,
    fontFamily: 'Nunito',
    package: getPackage,
  );

  static TextStyle extraSmallBold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.charlestonGreen,
    fontFamily: 'Nunito',
    package: getPackage,
  );
}
