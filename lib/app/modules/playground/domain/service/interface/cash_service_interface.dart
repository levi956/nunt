import 'package:nuntium_rigid/app/modules/playground/data/model/cash_request_model.dart';

abstract class CashServiceInterface {
  Stream<CashRequestModel> streamCashRequest(String id);
  Future<void> sendUpdatedLocation(String id);
}
