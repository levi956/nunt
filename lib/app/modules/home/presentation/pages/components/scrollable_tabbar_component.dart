import 'package:flutter/material.dart';
import 'package:nuntium_rigid/core/core.dart';

class ScrollableTabBarComponent extends StatelessWidget {
  final TabController controller;
  final List<String> options;

  const ScrollableTabBarComponent({
    super.key,
    required this.controller,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (colors) {
        return Theme(
          data: ThemeData(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
          child: TabBar(
            controller: controller,
            isScrollable: true,
            labelPadding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            indicatorPadding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
              right: 1,
              left: 1,
            ),
            unselectedLabelColor: colors.lightBlackDarkWhite,
            unselectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: colors.always475AD7,
            ),
            labelColor: colors.alwaysWhite,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            tabs: [
              for (final option in options) Tab(text: option),
            ],
          ),
        );
      },
    );
  }
}
