import 'package:flutter/material.dart';

Future<T?> pushTo<T>(
  BuildContext context,
  Widget page, {
  RouteSettings? settings,
}) async {
  final screenName = settings?.name ?? page.runtimeType.toString();
  return await Navigator.push<T>(
    context,
    MaterialPageRoute(
      builder: (context) => page,
      settings: RouteSettings(name: screenName, arguments: settings?.arguments),
    ),
  );
}

Future<T> pushReplacementTo<T>(
  BuildContext context,
  Widget page,
) async {
  final screenName = page.runtimeType.toString();

  return await Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => page,
      settings: RouteSettings(
        name: screenName,
      ),
    ),
  );
}

void pushToAndClearStack(BuildContext context, Widget page) {
  final screenName = page.runtimeType.toString();
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(
      builder: (context) => page,
      settings: RouteSettings(
        name: screenName,
      ),
    ),
    (route) => false,
  );
}

void pop<T>(BuildContext context, [T? value]) {
  return Navigator.pop<T>(context, value);
}

void popUntil(BuildContext context, Type type) {
  Navigator.of(context).popUntil(
    (route) => route.settings.name == type.toString(),
  );
}

void pushNamed(BuildContext context, String name) {
  Navigator.of(context).pushNamed(name);
}

void pushReplacementNamed(BuildContext context, String name) {
  Navigator.of(context).pushReplacementNamed(name);
}

Future<T?> pushToWithRoute<T>(BuildContext context, Route<T> route) async {
  return await Navigator.push<T>(context, route);
}

Future<T> pushReplacementToWithRoute<T>(
  BuildContext context,
  Route route,
) async {
  return await Navigator.pushReplacement(context, route);
}

enum PushStyle { material, cupertino }
