import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:nuntium_rigid/app/modules/news/data/model/news_model/news_model.dart';
import 'package:nuntium_rigid/app/modules/news/domain/service/interface/news_service_interface.dart';
import 'package:nuntium_rigid/app/shared/extensions/http_extensions.dart';
import 'package:nuntium_rigid/app/shared/shared.dart';
import 'package:nuntium_rigid/core/core.dart';

@LazySingleton(as: NewsServiceInterface)
class NewsService implements NewsServiceInterface {
  @override
  Future<List<NewsModel>> getCategoryNews(String category) async {
    final r = await HTTP.get('/top-headlines?country=us&category=$category');
    if (r.is200or201) {
      final body = jsonDecode(r.body);
      List<dynamic> articles = body['articles'];
      final news = articles.map((e) => NewsModel.fromJson(e)).toList();
      return news;
    }
    throw AppException.fromResponse(r);
  }

  @override
  Future<List<NewsModel>> getNews() async {
    HTTP.addHeader(
      key: 'Authorization',
      value: 'fae23e0131604ca99bd4b7c2fa7915c9',
    );
    final r = await HTTP.get('/top-headlines?country=us&category=general');
    if (r.is200or201) {
      final body = jsonDecode(r.body);
      List<dynamic> articles = body['articles'];
      final news = articles.map((e) => NewsModel.fromJson(e)).toList();
      return news;
    }
    throw AppException.fromResponse(r);
  }
}
