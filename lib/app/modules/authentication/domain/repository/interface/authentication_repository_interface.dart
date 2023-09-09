import 'package:nuntium_rigid/app/modules/authentication/data/login_model.dart';
import 'package:nuntium_rigid/app/modules/authentication/data/register_model.dart';

abstract interface class AuthenticationRepositoryInterface {
  Future<void> login(LoginModel model);
  Future<void> register(RegisterModel model);
  Future<void> logout();
  Future<void> signInAnonymous();
}
