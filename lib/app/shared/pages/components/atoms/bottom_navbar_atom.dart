import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nuntium_rigid/core/framework/theme/presentation/app_theme_builder.dart';

class BottomNavBarItemAtom extends StatelessWidget {
  final String svgPath;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const BottomNavBarItemAtom({
    super.key,
    required this.svgPath,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(builder: (color) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.only(
            bottom: 24,
            top: 10,
          ),
          color: Colors.transparent,
          child: Column(
            children: [
              SvgPicture.asset(
                svgPath,
                colorFilter: ColorFilter.mode(
                  isSelected ? color.always475AD7 : color.lightACAFC3Dark7C82A1,
                  BlendMode.srcIn,
                ),
              ),

              // Text(
              //   text,
              //   style: TextStyle(
              //     color: isSelected ? color.light007CFF : color.light8E98A8,
              //     fontSize: TextSizes.textSize12,
              //     fontWeight: FontWeight.w600,
              //   ),
              // ),
            ],
          ),
        ),
      );
    });
  }
}
