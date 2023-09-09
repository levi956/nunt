import 'package:flutter/material.dart';
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
