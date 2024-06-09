import 'package:injectable/injectable.dart';
import 'package:nuntium_rigid/app/modules/playground/data/model/cash_request_model.dart';
import 'package:nuntium_rigid/app/modules/playground/domain/repository/interface/cash_repository_interface.dart';
import 'package:nuntium_rigid/app/modules/playground/domain/service/interface/cash_service_interface.dart';

@LazySingleton(as: CashRepositoryInteface)
class CashRepository implements CashRepositoryInteface {
  final CashServiceInterface _cashService;

  CashRepository(this._cashService);

  @override
  Stream<CashRequestModel> streamCashRequest(String id) {
    return _cashService.streamCashRequest(id);
  }

  @override
  Future<void> sendUpdatedLocation(String id) {
    return _cashService.sendUpdatedLocation(id);
  }
}
