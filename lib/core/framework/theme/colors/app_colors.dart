import 'package:flutter/material.dart';

class AppColors {
  //light{LIGHTMODECOLOR}Dark{DARKMODECOLOR}
  final Color lightWhiteDarkBlack;
  final Color lightBlackDarkWhite;

  final Color alwaysWhite;
  final Color alwaysBlack;
  final Color always475AD7;
  final Color lightACAFC3Dark7C82A1;
  final Color light7C82A1DarkFFFFF;

  final Color light333647DarkFFFFF;
  final Color lightF3F4F6Dark5A5A5A;
  final Color light666C8EDarkFFFFF;

  // lightF3F4F6DarkF3F4F6,

  AppColors({
    required this.lightBlackDarkWhite,
    required this.lightWhiteDarkBlack,
    this.alwaysWhite = Colors.white,
    this.alwaysBlack = const Color(0xFF333647),
    this.always475AD7 = const Color(0xFF475AD7),
    required this.light7C82A1DarkFFFFF,
    required this.light333647DarkFFFFF,
    required this.lightF3F4F6Dark5A5A5A,
    required this.lightACAFC3Dark7C82A1,
    required this.light666C8EDarkFFFFF,
  });
}
