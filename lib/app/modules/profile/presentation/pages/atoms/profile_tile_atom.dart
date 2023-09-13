import 'package:flutter/material.dart';
import 'package:nuntium_rigid/app/shared/shared.dart';
import 'package:nuntium_rigid/core/core.dart';

class ProfileTileAtom extends StatefulWidget {
  final String text;

  final Widget routePage;
  final int index;

  const ProfileTileAtom({
    super.key,
    required this.text,
    required this.routePage,
    required this.index,
  });

  @override
  State<ProfileTileAtom> createState() => _ProfileTileAtomState();
}

class _ProfileTileAtomState extends State<ProfileTileAtom> with AppThemeMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.index == 5) {}
        if (widget.index == 4) {}
        // pushTo(context, routePage);
      },
      child: Container(
        padding: const EdgeInsets.all(19),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: colors.lightF3F4F6Dark5A5A5A,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BaseText(
              widget.text,
              color: colors.light666C8EDarkFFFFF,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: colors.light666C8EDarkFFFFF,
              size: 12,
            ),
          ],
        ),
      ),
    );
  }
}
