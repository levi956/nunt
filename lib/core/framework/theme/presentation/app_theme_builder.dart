import 'package:flutter/material.dart';
import 'package:nuntium_rigid/core/core.dart';

typedef AppThemeBuilderWidget = Widget Function(AppColors colors);

class AppThemeBuilder extends StatefulWidget {
  final AppThemeBuilderWidget builder;
  const AppThemeBuilder({super.key, required this.builder});

  @override
  State<AppThemeBuilder> createState() => _AppThemeBuilderState();
}

class _AppThemeBuilderState extends State<AppThemeBuilder> with AppThemeMixin {
  @override
  Widget build(BuildContext context) {
    return widget.builder(colors);
  }
}
