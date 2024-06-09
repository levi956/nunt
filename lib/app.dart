import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:nuntium_rigid/app/modules/authentication/presentation/pages/login_page.dart';
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
    WidgetsBinding.instance.addObserver(this);
    appThemeController = getIt<AppThemeController>();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      appThemeController.setThemeFromBrightness(brightness);
    });
    super.initState();
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
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        print("App is in resumed state");
        break;
      case AppLifecycleState.inactive:
        print("App is in inactive state");
        break;
      case AppLifecycleState.paused:
        print("App is in paused state");
        break;
      case AppLifecycleState.detached:
        print("App is in detached state");
        break;
      default:
        print("$state");
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return const LoginPage();
  }
}
