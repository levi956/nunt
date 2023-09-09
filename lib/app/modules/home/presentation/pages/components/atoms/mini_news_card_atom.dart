import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nuntium_rigid/app/modules/news/data/model/news_model/news_model.dart';
import 'package:nuntium_rigid/app/shared/shared.dart';
import 'package:nuntium_rigid/core/core.dart';

class MiniNewsCardAtom extends StatefulWidget {
  final NewsModel model;
  const MiniNewsCardAtom(
    this.model, {
    super.key,
  });

  @override
  State<MiniNewsCardAtom> createState() => _MiniNewsCardAtomState();
}

class _MiniNewsCardAtomState extends State<MiniNewsCardAtom>
    with AppThemeMixin {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 256.7,
        width: 256.86,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              widget.model.urlToImage ?? defaultImage,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(
                left: 10,
                top: 10,
                right: 20,
              ),
              child: BaseText(
                widget.model.author ?? '',
                color: colors.lightWhiteDarkBlack,
                fontWeight: FontWeight.bold,
                fontSize: 12,
                maxLines: 2,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 10,
                top: 5,
                bottom: 20,
              ),
              child: BaseText(
                widget.model.description ?? '',
                color: colors.lightWhiteDarkBlack,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
