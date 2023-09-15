import 'package:albumapp/app/core/ui/styles/button_styles.dart';
import 'package:albumapp/app/core/ui/styles/colors_app.dart';
import 'package:albumapp/app/core/ui/styles/text_styles.dart';
import 'package:albumapp/app/core/ui/widgets/button.dart';
import 'package:albumapp/app/pages/splash/presenter/splash_presenter.dart';
import 'package:albumapp/app/pages/splash/view/splash_view_impl.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  final SplashPresenter presenter;
  const SplashPage({super.key, required this.presenter});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends SplashViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_splash.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.08),
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/fifa_logo.png',
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * .19),
                child: Button(
                  width: MediaQuery.of(context).size.height * .4,
                  onPressed: () {
                    widget.presenter.checkLogin();
                  },
                  style: context.buttonStyles.yellowButton,
                  labelStyle:
                      context.textStyles.textSecondaryFontExtraBoldPrimaryColor,
                  label: 'Acessar',
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Image.asset('assets/images/bandeiras.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
