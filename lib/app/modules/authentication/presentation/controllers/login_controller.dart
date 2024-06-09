import 'package:injectable/injectable.dart';
import 'package:nuntium_rigid/app/modules/authentication/data/login_model.dart';
import 'package:nuntium_rigid/app/modules/authentication/domain/repository/interface/authentication_repository_interface.dart';
import 'package:nuntium_rigid/core/core.dart';

@lazySingleton
class LoginController extends BaseController<LoginModel, void> {
  LoginController({
    required AuthenticationRepositoryInterface repository,
  }) : super(function: repository.login);
  void login({
    required String email,
    required String password,
  }) {
    final model = LoginModel(
      email: email,
      password: password,
    );
    trigger(model);
  }
}
