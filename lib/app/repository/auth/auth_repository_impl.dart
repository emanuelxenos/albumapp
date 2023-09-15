import 'dart:developer';

import 'package:albumapp/app/core/exceptions/respository_exception.dart';
import 'package:albumapp/app/core/exceptions/unauthorized_exception.dart';
import 'package:albumapp/app/core/rest/custom_dio.dart';
import 'package:albumapp/app/models/register_user_model.dart';
import 'package:dio/dio.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;
  AuthRepositoryImpl({required this.dio});

  @override
  Future<String> login(
      {required String email, required String password}) async {
    try {
      final result = await dio.post('/api/auth', data: {
        'email': email,
        'password': password,
      });

      final accessToken = result.data['access_token'];

      if (accessToken == null) {
        throw UnauthorizedException();
      }

      return accessToken;
    } on DioError catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);
      if (e.response?.statusCode == 401) {
        throw UnauthorizedException();
      }

      throw RespositoryException(message: 'Erro ao realizar login');
    }
  }

  @override
  Future<void> logout() {
    throw UnimplementedError();
  }

  @override
  Future<void> register(RegisterUserModel registerModel) async {
    try {
      await dio.unAuth().post('/api/register', data: registerModel.toMap());
    } on DioError catch (e, s) {
      log('Erro ao registrar usuário', error: e, stackTrace: s);
      throw RespositoryException(message: 'Erroa o registrar usuário');
    }
  }
}
