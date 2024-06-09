import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:nuntium_rigid/app/modules/playground/data/model/cash_request_model.dart';
import 'package:nuntium_rigid/app/modules/playground/domain/service/interface/cash_service_interface.dart';

@LazySingleton(as: CashServiceInterface)
class CashService implements CashServiceInterface {
  final FirebaseFirestore _firestore;

  CashService(this._firestore);

  CollectionReference<Map<String, dynamic>> get collection {
    return _firestore.collection('ongoingTransactions');
  }

  @override
  Stream<CashRequestModel> streamCashRequest(String id) {
    return collection.doc(id).snapshots().map(
      (snapshot) {
        final data = snapshot.data();
        return CashRequestModel.fromJson(data!);
      },
    );
  }

  @override
  Future<void> sendUpdatedLocation(String id) async {
    //GET THE DEVICE LOCATION HERE (DEMO)
    await collection.doc(id).update(
      {
        "provider.coordinates.latitude": 4.4,
        "provider.coordinates.longitude": 7.4,
      },
    );
  }
}
