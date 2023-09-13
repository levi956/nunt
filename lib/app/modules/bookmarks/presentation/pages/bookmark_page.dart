import 'package:flutter/material.dart';
import 'package:nuntium_rigid/app/shared/shared.dart';
import 'package:nuntium_rigid/core/core.dart';

class BookMarkPage extends StatefulWidget {
  const BookMarkPage({super.key});

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage>
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
                'Bookmarks',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              const SizedBox(height: 20),
              BaseText(
                'Saved articles to your library',
                fontSize: 16,
                color: colors.light7C82A1DarkFFFFF,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
