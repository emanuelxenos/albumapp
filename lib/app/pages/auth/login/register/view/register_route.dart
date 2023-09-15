import 'package:albumapp/app/pages/auth/login/register/presenter/register_presenter.dart';
import 'package:albumapp/app/pages/auth/login/register/presenter/register_presenter_impl.dart';
import 'package:albumapp/app/pages/auth/login/register/register_page.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';

class RegisterRoute extends FlutterGetItPageRoute {
  const RegisterRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<RegisterPresenter>(
            (i) => RegisterPresenterImpl(authRepository: i()))
      ];

  @override
  WidgetBuilder get page =>
      ((context) => RegisterPage(presenter: context.get()));
}
