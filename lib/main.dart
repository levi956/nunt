import 'package:flutter/material.dart';
import 'package:nuntium_rigid/app.dart';
import 'package:nuntium_rigid/core/environment/environment.dart';
import 'package:nuntium_rigid/injectable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvironmentSetup.run(environment: Environment.test);
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nuntium',
      theme: ThemeData(
        fontFamily: 'SFPRO',
        useMaterial3: false,
      ),
      home: const App(),
    );
  }
}
