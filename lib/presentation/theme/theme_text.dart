import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/common/extensions/size_extension.dart';

import '../../common/constants/size_constants.dart';


class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();
  static TextStyle get _whiteHeadline6 => _poppinsTextTheme.headline6!.copyWith(
    fontSize: Sizes.dimen_20.sp.toDouble(),
    color: Colors.white,
  );
  static getTextTheme() => TextTheme(
    headline6: _whiteHeadline6,
  );
}