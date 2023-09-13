import 'package:flutter/material.dart';
import 'package:nuntium_rigid/app/shared/constants/images/images_constants.dart';
import 'package:nuntium_rigid/app/shared/extensions/list_extensions.dart';
import 'package:nuntium_rigid/app/shared/pages/components/atoms/bottom_navbar_atom.dart';
import 'package:nuntium_rigid/core/framework/theme/presentation/app_theme_mixin.dart';

class BottomNavBarComponent extends StatefulWidget {
  final ValueChanged<int> onItemSelected;
  final int selectedIndex;

  const BottomNavBarComponent({
    super.key,
    required this.onItemSelected,
    required this.selectedIndex,
  });

  @override
  State<BottomNavBarComponent> createState() => _BottomNavBarComponentState();
}

class _BottomNavBarComponentState extends State<BottomNavBarComponent>
    with AppThemeMixin {
  @override
  Widget build(BuildContext context) {
    final items = <({String svgPath, String text})>[
      (
        svgPath: Svgs.home,
        text: 'Home',
      ),
      (
        svgPath: Svgs.category,
        text: 'Transactions',
      ),
      (
        svgPath: Svgs.bookmark,
        text: 'Cards',
      ),
      (
        svgPath: Svgs.user,
        text: 'Settings',
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        color: colors.lightWhiteDarkBlack,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 10,
      ),
      child: Row(
        children: [
          for (final (index, item) in items.enumerate())
            Expanded(
              child: BottomNavBarItemAtom(
                svgPath: item.svgPath,
                text: item.text,
                isSelected: index == widget.selectedIndex,
                onTap: () {
                  widget.onItemSelected(index);
                },
              ),
            ),
        ],
      ),
    );
  }
}
