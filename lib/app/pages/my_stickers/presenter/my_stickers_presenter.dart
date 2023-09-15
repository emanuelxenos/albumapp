import 'package:albumapp/app/core/mvp/fwc_presenter.dart';
import 'package:albumapp/app/pages/my_stickers/view/my_stickers_view.dart';

abstract class MyStickersPresenter extends FwcPresenter<MyStickersView> {
  Future<void> getMyAlbum();
  Future<void> statusFilter(String status);
  void countryFilter(List<String>? countries);

  Future<void> refresh();
}
