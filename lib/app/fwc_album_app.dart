import 'package:albumapp/app/core/rest/custom_dio.dart';
import 'package:albumapp/app/core/theme/theme_config.dart';
import 'package:albumapp/app/core/ui/global/global_context.dart';
import 'package:albumapp/app/core/ui/global/global_context_impl.dart';
import 'package:albumapp/app/pages/auth/login/login_route.dart';
import 'package:albumapp/app/pages/auth/login/register/view/register_route.dart';
import 'package:albumapp/app/pages/home/home_page.dart';
import 'package:albumapp/app/pages/home/home_route.dart';
import 'package:albumapp/app/pages/my_stickers/my_sticker_page.dart';
import 'package:albumapp/app/pages/my_stickers/my_sticker_route.dart';
import 'package:albumapp/app/pages/splash/view/splash_route.dart';
import 'package:albumapp/app/pages/sticker_detail/sticker_detail_route.dart';
import 'package:albumapp/app/repository/auth/auth_repository.dart';
import 'package:albumapp/app/repository/auth/auth_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class FwcAlbumApp extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  FwcAlbumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton<CustomDio>((i) => CustomDio()),
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl(dio: i())),
        Bind.lazySingleton<GlobalContext>((i) =>
            GlobalContextImpl(navigatorKey: navigatorKey, authRepository: i()))
      ],
      child: MaterialApp(
        title: 'Fifa Word Cup Album',
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        theme: ThemeConfig.theme,
        routes: {
          '/': (_) => const SplashRoute(),
          '/auth/login': (_) => const LoginRoute(),
          '/auth/register': (_) => const RegisterRoute(),
          '/home': (_) => const HomeRoute(),
          '/myStickers': (_) => const MyStickerRoute(),
          '/stickerDetail': (_) => const StickerDetailRoute(),
        },
      ),
    );
  }
}
