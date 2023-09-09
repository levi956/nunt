import 'package:injectable/injectable.dart';
import 'package:nuntium_rigid/app/modules/news/data/model/news_model/news_model.dart';
import 'package:nuntium_rigid/app/modules/news/domain/repository/interface/news_repository_interface.dart';
import 'package:nuntium_rigid/core/core.dart';

@lazySingleton
class GetNewsController extends NoArgBaseController<List<NewsModel>> {
  GetNewsController({
    required NewsRepositoryInterface repository,
  }) : super(function: repository.getNews);
}
