import 'package:albumapp/app/pages/splash/presenter/splash_presenter.dart';
import 'package:albumapp/app/pages/splash/presenter/splash_presenter_impl.dart';
import 'package:albumapp/app/pages/splash/splash_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_getit/flutter_getit.dart';

class SplashRoute extends FlutterGetItPageRoute {
  const SplashRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<SplashPresenter>((i) => SplashPresenterImpl()),
      ];

  @override
  WidgetBuilder get page => (context) => SplashPage(presenter: context.get());
}
