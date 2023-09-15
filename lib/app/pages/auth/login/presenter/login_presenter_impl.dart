import 'dart:developer';

import 'package:albumapp/app/core/exceptions/unauthorized_exception.dart';
import 'package:albumapp/app/pages/auth/login/view/login_view.dart';
import 'package:albumapp/app/services/login/login_service.dart';

import './login_presenter.dart';

class LoginPresenterImpl implements LoginPresenter {
  late final LoginView _view;
  final LoginService loginService;

  LoginPresenterImpl({
    required this.loginService,
  });

  @override
  Future<void> login(String email, String password) async {
    try {
      await loginService.execute(email: email, password: password);
      _view.success();
    } on UnauthorizedException {
      _view.error('Usuário ou senha inválida');
    } catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);
      _view.error('Erroa o realizar login');
    }
  }

  @override
  set view(LoginView view) => _view = view;
}
