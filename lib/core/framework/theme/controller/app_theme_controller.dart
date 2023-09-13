import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

import '../colors/app_theme.dart';

@lazySingleton
class AppThemeController {
  final Sink<AppTheme> _sink;
  final Stream<AppTheme> stream;

  AppThemeController._({
    required Sink<AppTheme> themeSink,
    required this.stream,
  }) : _sink = themeSink;

  factory AppThemeController() {
    final subject = BehaviorSubject<AppTheme>();
    final themeStream = subject.distinct();
    return AppThemeController._(
      themeSink: subject,
      stream: themeStream,
    );
  }

  void setTheme(AppTheme theme) {
    if (theme.mode == ThemeMode.dark) {
      setStatusBarColor(color: BarColor.white);
      _sink.add(theme);
      return;
    }
    setStatusBarColor(color: BarColor.black);
    _sink.add(theme);
  }

  void setThemeFromBrightness(Brightness brightness) {
    if (brightness == Brightness.light) {
      setTheme(AppTheme.light());
      return;
    }
    setTheme(AppTheme.dark());
  }

  void dispose() {
    _sink.close();
  }
}

void setStatusBarColor({required BarColor color}) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarBrightness:
            color == BarColor.white ? Brightness.dark : Brightness.light),
  );
}

enum BarColor { white, black }
