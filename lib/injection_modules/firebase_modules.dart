import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:nuntium_rigid/firebase_options.dart';

@module
abstract class FirebaseModule {
  @preResolve
  Future<FirebaseApp> getFirebaseApp() async {
    return await Firebase.initializeApp(
      name: 'Nuntium',
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @lazySingleton
  FirebaseAuth getFirebaseAuth(FirebaseApp app) {
    return FirebaseAuth.instanceFor(app: app);
  }
}
