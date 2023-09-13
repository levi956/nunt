import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:nuntium_rigid/app/shared/shared.dart';
import 'package:nuntium_rigid/core/core.dart';
import 'package:nuntium_rigid/injectable.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  late final AppThemeController appThemeController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    appThemeController = getIt<AppThemeController>();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      appThemeController.setThemeFromBrightness(brightness);
    });
  }

  Brightness get brightness {
    return WidgetsBinding.instance.platformDispatcher.platformBrightness;
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    appThemeController.setThemeFromBrightness(brightness);
  }

  @override
  Widget build(BuildContext context) {
    return const DashboardPage();
  }
}
