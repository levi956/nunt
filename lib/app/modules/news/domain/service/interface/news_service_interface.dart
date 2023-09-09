import 'package:nuntium_rigid/app/modules/news/data/model/news_model/news_model.dart';

abstract class NewsServiceInterface {
  Future<List<NewsModel>> getNews();
  Future<List<NewsModel>> getCategoryNews(String category);
}
