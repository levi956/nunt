import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  final AppColors colors;
  final ThemeMode mode;

  const AppTheme._({
    required this.colors,
    required this.mode,
  });

  factory AppTheme.light() {
    return AppTheme._(
      mode: ThemeMode.light,
      colors: AppColors(
        lightWhiteDarkBlack: Colors.white,
        light333647DarkFFFFF: const Color(0xFF333647),
        light7C82A1DarkFFFFF: const Color(0xFF7C82A1),
        lightBlackDarkWhite: const Color(0xFF333647),
        lightF3F4F6Dark5A5A5A: const Color(0xFFF3F4F6),
        always475AD7: const Color(0xFF475AD7),
        alwaysBlack: const Color(0xFF333647),
        alwaysWhite: Colors.white,
        lightACAFC3Dark7C82A1: const Color(0xFFACAFC3),
        light666C8EDarkFFFFF: const Color(0xFF666C8E),
      ),
    );
  }

  factory AppTheme.dark() {
    return AppTheme._(
      mode: ThemeMode.dark,
      colors: AppColors(
        lightWhiteDarkBlack: Colors.black,
        always475AD7: const Color(0xFF475AD7),
        alwaysBlack: const Color(0xFF333647),
        alwaysWhite: Colors.white,
        light333647DarkFFFFF: Colors.white,
        light7C82A1DarkFFFFF: Colors.white,
        lightBlackDarkWhite: Colors.white,
        lightF3F4F6Dark5A5A5A: const Color(0xFF5A5A5A),
        lightACAFC3Dark7C82A1: const Color(0xFF7C82A1),
        light666C8EDarkFFFFF: Colors.white,
      ),
    );
  }
}
