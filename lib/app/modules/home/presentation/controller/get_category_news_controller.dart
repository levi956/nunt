import 'package:injectable/injectable.dart';
import 'package:nuntium_rigid/app/modules/news/data/model/news_model/news_model.dart';
import 'package:nuntium_rigid/app/modules/news/domain/repository/interface/news_repository_interface.dart';
import 'package:nuntium_rigid/core/core.dart';

@lazySingleton
class GetNewsCategoryController
    extends BaseController<String, List<NewsModel>> {
  GetNewsCategoryController({required NewsRepositoryInterface repository})
      : super(function: repository.getCategoryNews);

  void getCategoryNews({required String category}) {
    trigger(category);
  }
}
