import 'package:flutter/material.dart';
import 'package:nuntium_rigid/app/modules/home/presentation/controller/get_category_news_controller.dart';
import 'package:nuntium_rigid/app/modules/home/presentation/pages/components/atoms/mini_news_card_atom.dart';
import 'package:nuntium_rigid/app/shared/shared.dart';
import 'package:nuntium_rigid/core/core.dart';
import 'package:nuntium_rigid/injectable.dart';

class MiniNewsCardComponent extends StatefulWidget {
  final String category;
  const MiniNewsCardComponent({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<MiniNewsCardComponent> createState() => _MiniNewsCardComponentState();
}

class _MiniNewsCardComponentState extends State<MiniNewsCardComponent>
    with AppThemeMixin {
  late GetNewsCategoryController getNewsCategoryController;

  @override
  void initState() {
    getNewsCategoryController = getIt<GetNewsCategoryController>();
    getNewsCategoryController.getCategoryNews(category: widget.category);
    super.initState();
  }

  @override
  void dispose() {
    getNewsCategoryController.removeListeners();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return getNewsCategoryController.buildWhen(
      success: (news) {
        if (news.isEmpty) {
          return const BaseText(
            'No news',
            fontWeight: FontWeight.bold,
          );
        }
        return ListView.separated(
          separatorBuilder: (_, __) => const SizedBox(width: 10),
          itemCount: news.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final article = news[index];
            return MiniNewsCardAtom(article);
          },
        );
      },
      failure: (e) => BaseText(
        e.toString(),
      ),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
