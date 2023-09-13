import 'package:flutter/material.dart';
import 'package:nuntium_rigid/app/modules/bookmarks/presentation/pages/bookmark_page.dart';
import 'package:nuntium_rigid/app/modules/home/presentation/pages/home_page.dart';
import 'package:nuntium_rigid/app/modules/profile/presentation/pages/profile_page.dart';
import 'package:nuntium_rigid/app/shared/pages/components/bottom_navigation_bar_component.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: IndexedStack(
            index: selectedIndex,
            children: const [
              HomePage(),
              SizedBox(),
              BookMarkPage(),
              ProfilePage(),
            ],
          ),
        ),
        BottomNavBarComponent(
          selectedIndex: selectedIndex,
          onItemSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ],
    );
  }
}
