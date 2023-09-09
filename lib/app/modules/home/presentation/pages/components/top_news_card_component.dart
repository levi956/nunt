import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nuntium_rigid/app/modules/news/data/model/news_model/news_model.dart';
import 'package:nuntium_rigid/app/shared/shared.dart';
import 'package:nuntium_rigid/core/core.dart';

class TopNewsCardComponent extends StatefulWidget {
  final NewsModel news;
  const TopNewsCardComponent(this.news, {Key? key}) : super(key: key);

  @override
  State<TopNewsCardComponent> createState() => _TopNewsCardComponentState();
}

class _TopNewsCardComponentState extends State<TopNewsCardComponent>
    with AppThemeMixin {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: CachedNetworkImage(
                imageUrl: widget.news.urlToImage,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              color: colors.lightF3F4F6DarkF3F4F6,
              child: BaseText(
                widget.news.title,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.only(
                bottom: 10,
                left: 10,
                right: 10,
              ),
              decoration: BoxDecoration(
                color: colors.lightWhiteDarkBlack,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: BaseText(
                widget.news.description,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                //   overflow: TextOverflow.ellipsis,
                //   maxLines: 3,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
