import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/common/extensions/size_extension.dart';
import 'package:movie_app/presentation/theme/theme_color.dart';

import '../../common/constants/size_constants.dart';


class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();
  static TextStyle get _whiteHeadline6 => _poppinsTextTheme.headline6!.copyWith(
    fontSize: Sizes.dimen_20.sp.toDouble(),
    color: Colors.white,
  );
  static TextStyle get _whiteSubtitle1 => _poppinsTextTheme.subtitle1!.copyWith(
    color: Colors.white,
    fontSize: Sizes.dimen_16.sp.toDouble(),
  );
  static TextStyle get _whiteBodyText2 => _poppinsTextTheme.bodyText2!.copyWith(
    color: Colors.white,
    fontSize: Sizes.dimen_14.sp.toDouble(),
    wordSpacing: 0.25,
    letterSpacing: 0.25,
    height: 1.5,
  );
  static getTextTheme() => TextTheme(
    headline6: _whiteHeadline6,
    subtitle1: _whiteSubtitle1,
    bodyText2: _whiteBodyText2,
  );


}
extension ThemeTextExtension on TextTheme{
  TextStyle get royalBlueSubtitle1 => ThemeText._whiteSubtitle1.copyWith(
    color: AppColor.royalBlue,
    fontWeight: FontWeight.w600,
  );
}
