import 'package:nuntium_rigid/app/modules/news/data/model/news_model/news_model.dart';

abstract class NewsRepositoryInterface {
  Future<List<NewsModel>> getNews();
  Future<List<NewsModel>> getCategoryNews(String keyword);
}
