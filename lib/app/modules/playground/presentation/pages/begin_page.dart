import 'package:flutter/material.dart';
import 'package:nuntium_rigid/app/shared/components/custom_button_component.dart';
import 'package:nuntium_rigid/core/framework/theme/presentation/app_theme_mixin.dart';

class BeginPage extends StatefulWidget {
  const BeginPage({super.key});

  @override
  State<BeginPage> createState() => _BeginPageState();
}

class _BeginPageState extends State<BeginPage> with AppThemeMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButton(
          text: "Search providers",
          onPressed: () {},
        ),
      ),
    );
  }
}
