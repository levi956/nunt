import '../../../data/model/cash_request_model.dart';

abstract interface class CashRepositoryInteface {
  Stream<CashRequestModel> streamCashRequest(String id);
  Future<void> sendUpdatedLocation(String id);
}
