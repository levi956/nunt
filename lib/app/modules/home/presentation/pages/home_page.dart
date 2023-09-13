import 'package:flutter/material.dart';
import 'package:nuntium_rigid/app/modules/home/presentation/controller/get_news_controller.dart';
import 'package:nuntium_rigid/app/modules/home/presentation/pages/components/mini_news_card_component.dart';
import 'package:nuntium_rigid/app/modules/home/presentation/pages/components/scrollable_tabbar_component.dart';
import 'package:nuntium_rigid/app/modules/home/presentation/pages/components/top_news_card_component.dart';
import 'package:nuntium_rigid/app/shared/shared.dart';
import 'package:nuntium_rigid/core/core.dart';
import 'package:nuntium_rigid/injectable.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AppThemeMixin, TickerProviderStateMixin {
  late TabController tabController;

  late GetNewsController getNewsController;

  int tabIndex = 0;

  final categories = ['general', 'sports', 'technology', 'business'];

  @override
  void initState() {
    getNewsController = getIt<GetNewsController>();
    getNewsController.get();
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      tabIndex = tabController.index;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    getNewsController.reset();
    tabController.dispose();
    super.dispose();
  }

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
                'Browse',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              const SizedBox(height: 20),
              BaseText(
                'Discover things of the world',
                fontSize: 16,
                color: colors.light7C82A1DarkFFFFF,
              ),
              const SizedBox(height: 20),
              ScrollableTabBarComponent(
                controller: tabController,
                options: const [
                  'General',
                  'Sports',
                  'Technology',
                  'Business',
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.22,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: [
                    for (final category in categories)
                      MiniNewsCardComponent(category: category),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const BaseText(
                'Recommended for you',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              const SizedBox(height: 20),
              getNewsController.buildWhen(
                success: (news) {
                  if (news.isEmpty) {
                    return const BaseText(
                      'No news',
                      fontWeight: FontWeight.bold,
                    );
                  }
                  return Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemCount: news.length,
                      itemBuilder: (_, index) {
                        final topNew = news[index];
                        return TopNewsCardComponent(topNew);
                      },
                    ),
                  );
                },
                failure: (e) => BaseText(
                  e.toString(),
                ),
                loading: () => const CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
