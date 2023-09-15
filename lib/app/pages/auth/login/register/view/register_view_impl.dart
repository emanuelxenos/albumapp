import 'package:albumapp/app/core/ui/helpers/loader.dart';
import 'package:albumapp/app/core/ui/helpers/messages.dart';
import 'package:albumapp/app/pages/auth/login/register/register_page.dart';
import 'package:flutter/widgets.dart';

import './register_view.dart';

abstract class RegisterViewImpl extends State<RegisterPage>
    with Messages<RegisterPage>, Loader<RegisterPage>
    implements RegisterView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }

  @override
  void registerError([String? message]) {
    hideLoader();
    showError(message ?? 'Erro ao registrar usuário');
  }

  @override
  void resgisterSuccess() {
    hideLoader();
    showSuccess('Usuário cadastrado com sucesso');
    Navigator.of(context).pop();
  }
}
