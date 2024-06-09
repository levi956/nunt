import 'package:flutter/material.dart';
import 'package:nuntium_rigid/core/framework/theme/controller/app_theme_controller.dart';
import 'package:nuntium_rigid/injectable.dart';

import '../colors/app_colors.dart';
import '../colors/app_theme.dart';

mixin AppThemeMixin<T extends StatefulWidget> on State<T> {
  late AppTheme theme = AppTheme.dark();
  late AppColors colors = theme.colors;

  @override
  void initState() {
    getIt<AppThemeController>().stream.listen((theme) {
      if (mounted) {
        setState(() {
          this.theme = theme;
          this.colors = theme.colors;
        });
      }
    });
    super.initState();
  }
}
