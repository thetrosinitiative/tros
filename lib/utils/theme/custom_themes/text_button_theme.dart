import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TTextButtonTheme {
  TTextButtonTheme._();
  static final lightTextButtonTheme = TextButtonThemeData(
      style: TextButton.styleFrom(
    backgroundColor: PColors.transparent,
    elevation: 0,
    // side: const BorderSide(color: PColors.primary),
    textStyle: const TextStyle(
        fontSize: 16, color: PColors.primary, fontWeight: FontWeight.w600),
  ));

  static final darkTextButtonTheme = TextButtonThemeData(
      style: TextButton.styleFrom(
    elevation: 0,
    // side: const BorderSide(color: PColors.primary),
    backgroundColor: PColors.transparent,

    textStyle: const TextStyle(
        fontSize: 16, color: PColors.primary, fontWeight: FontWeight.w600),
  ));
}
