import 'package:flutter/material.dart';
import 'package:nuntium_rigid/app/modules/profile/presentation/pages/components/profile_card_options_component.dart';
import 'package:nuntium_rigid/app/shared/shared.dart';
import 'package:nuntium_rigid/core/core.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AppThemeMixin, TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.lightWhiteDarkBlack,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BaseText(
                'Profile',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView(
                  children: const [
                    ProfileOptionsComponent(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
