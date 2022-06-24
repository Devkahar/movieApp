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
  static TextStyle get _whiteHeadline5 => _poppinsTextTheme.headline5!.copyWith(
    fontSize: Sizes.dimen_24.sp.toDouble(),
    color: Colors.white,
  );
  static TextStyle get _whiteButton => _poppinsTextTheme.button!.copyWith(
    fontSize: Sizes.dimen_16.sp.toDouble(),
    color: Colors.white,
  );
  static getTextTheme() => TextTheme(
    button: _whiteButton,
    headline5: _whiteHeadline5,
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
  TextStyle get greySubtitle1 => ThemeText._whiteSubtitle1.copyWith(
    color: Colors.grey,
  );
  TextStyle get violet => ThemeText._whiteHeadline6.copyWith(
    color: AppColor.violet,
  );
  TextStyle get vulcanBodyText2 => ThemeText._whiteBodyText2.copyWith(
    color: AppColor.vulcan,
    fontWeight: FontWeight.w600,
  );
  TextStyle get greyCaption => ThemeText._whiteBodyText2.copyWith(
    color: Colors.grey,
  );
  TextStyle get orangeSubtitle1 => ThemeText._whiteSubtitle1.copyWith(
    color: Colors.orangeAccent,
  );
}
