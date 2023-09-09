import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:nuntium_rigid/app/modules/authentication/domain/service/interface/authentication_service_interface.dart';

@LazySingleton(as: AuthenticationServiceInterface)
class AuthenticationService implements AuthenticationServiceInterface {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  @override
  Future<void> login({required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> register(
      {required String email,
      required String password,
      required String firstName,
      required String lastName}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signInAnonymous() async {
    await _firebaseAuth.signInAnonymously();
  }
}
