import 'package:injectable/injectable.dart';
import 'package:nuntium_rigid/app/modules/authentication/data/login_model.dart';
import 'package:nuntium_rigid/app/modules/authentication/data/register_model.dart';
import 'package:nuntium_rigid/app/modules/authentication/domain/repository/interface/authentication_repository_interface.dart';
import 'package:nuntium_rigid/app/modules/authentication/domain/service/interface/authentication_service_interface.dart';

@LazySingleton(as: AuthenticationRepositoryInterface)
class AuthenticationRepository implements AuthenticationRepositoryInterface {
  final AuthenticationServiceInterface _authenticationService;

  AuthenticationRepository(this._authenticationService);

  @override
  Future<void> login(LoginModel model) {
    return _authenticationService.login(
      email: model.email,
      password: model.password,
    );
  }

  @override
  Future<void> logout() {
    return _authenticationService.logout();
  }

  @override
  Future<void> register(RegisterModel model) {
    return _authenticationService.register(
      email: model.email,
      password: model.password,
      firstName: model.firstName,
      lastName: model.lastName,
    );
  }

  @override
  Future<void> signInAnonymous() {
    return _authenticationService.signInAnonymous();
  }
}
