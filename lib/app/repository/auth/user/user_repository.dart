import 'package:albumapp/app/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getMe();
}
