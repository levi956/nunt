import 'package:injectable/injectable.dart';
import 'package:nuntium_rigid/app/modules/playground/data/model/cash_request_model.dart';
import 'package:nuntium_rigid/app/modules/playground/domain/repository/interface/cash_repository_interface.dart';
import 'package:nuntium_rigid/core/core.dart';

@lazySingleton
class GetCashRequestController
    extends BaseController<String, CashRequestModel> {
  GetCashRequestController({
    required CashRepositoryInteface repository,
  }) : super(function: repository.streamCashRequest);

  void getRequest({required String id}) {
    trigger(id);
  }
}
