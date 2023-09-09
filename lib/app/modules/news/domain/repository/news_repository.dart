import 'package:injectable/injectable.dart';
import 'package:nuntium_rigid/app/modules/news/data/model/news_model/news_model.dart';
import 'package:nuntium_rigid/app/modules/news/domain/repository/interface/news_repository_interface.dart';
import 'package:nuntium_rigid/app/modules/news/domain/service/interface/news_service_interface.dart';

@LazySingleton(as: NewsRepositoryInterface)
class NewsRepository implements NewsRepositoryInterface {
  late final NewsServiceInterface _newsService;

  NewsRepository(this._newsService);

  @override
  Future<List<NewsModel>> getCategoryNews(String keywoord) {
    throw UnimplementedError();
  }

  @override
  Future<List<NewsModel>> getNews() {
    return _newsService.getNews();
  }
}
