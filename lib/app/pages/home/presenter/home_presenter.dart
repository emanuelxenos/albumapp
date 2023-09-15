import 'package:albumapp/app/core/mvp/fwc_presenter.dart';
import 'package:albumapp/app/pages/home/view/home_view.dart';

abstract class HomePresenter extends FwcPresenter<HomeView> {
  Future<void> getUserData();
  Future<void> logout();
}
