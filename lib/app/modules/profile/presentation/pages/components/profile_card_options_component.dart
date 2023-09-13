import 'package:flutter/material.dart';
import 'package:nuntium_rigid/app/modules/profile/presentation/pages/atoms/profile_tile_atom.dart';
import 'package:nuntium_rigid/app/shared/shared.dart';

class ProfileOptionsComponent extends StatefulWidget {
  const ProfileOptionsComponent({super.key});

  @override
  State<ProfileOptionsComponent> createState() =>
      _ProfileOptionsComponentState();
}

class _ProfileOptionsComponentState extends State<ProfileOptionsComponent> {
  @override
  Widget build(BuildContext context) {
    final items = <({
      String text,
      Widget page,
    })>[
      (
        text: 'Notifications',
        page: const SizedBox(),
      ),
      (
        text: 'Light Mode?',
        page: const SizedBox(),
      ),
      (
        text: 'Change Password',
        page: const SizedBox(),
      ),
      (
        text: 'Privacy',
        page: const SizedBox(),
      ),
      (
        text: 'Terms and Conditions',
        page: const SizedBox(),
      ),
      (
        text: 'Logout',
        page: const SizedBox(),
      ),
    ];

    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final (index, item) in items.enumerate())
            ProfileTileAtom(
              routePage: item.page,
              index: index,
              text: item.text,
            ),
        ],
      ),
    );
  }
}
