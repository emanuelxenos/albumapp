import 'package:albumapp/app/core/ui/helpers/loader.dart';
import 'package:albumapp/app/core/ui/helpers/messages.dart';
import 'package:albumapp/app/pages/auth/login/login_page.dart';
import 'package:flutter/widgets.dart';

import './login_view.dart';

abstract class LoginViewImpl extends State<LoginPage>
    with Messages<LoginPage>, Loader<LoginPage>
    implements LoginView {
  @override
  void initState() {
    widget.prresenter.view = this;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  void error(String message) {
    hideLoader();
    showError(message);
  }

  @override
  void success() {
    hideLoader();
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
  }
}
