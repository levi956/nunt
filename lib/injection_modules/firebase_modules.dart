import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:nuntium_rigid/firebase_options.dart';

@module
abstract class FirebaseModule {
  @preResolve
  Future<FirebaseApp> getFirebaseApp() async {
    return await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @lazySingleton
  FirebaseAuth getFirebaseAuth(FirebaseApp app) {
    return FirebaseAuth.instanceFor(app: app);
  }

  @lazySingleton
  FirebaseFirestore getFirebaseFirestore(FirebaseApp app) {
    return FirebaseFirestore.instanceFor(app: app);
  }

  @lazySingleton
  FirebaseRemoteConfig get remoteConfigs => FirebaseRemoteConfig.instance;
}


// dart run build_runner build --delete-conflicting-outputs