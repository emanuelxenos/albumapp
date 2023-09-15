import 'dart:developer';

import 'package:albumapp/app/core/exceptions/respository_exception.dart';
import 'package:albumapp/app/core/rest/custom_dio.dart';
import 'package:albumapp/app/models/groups_stickers.dart';
import 'package:albumapp/app/models/register_sticker_model.dart';
import 'package:albumapp/app/models/sticker_model.dart';
import 'package:dio/dio.dart';

import './stickers_repository.dart';

class StickersRepositoryImpl implements StickersRepository {
  final CustomDio dio;

  StickersRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<GroupsStickers>> getMyAlbum() async {
    try {
      final result = await dio.auth().get('/api/countries');
      return result.data
          .map<GroupsStickers>((g) => GroupsStickers.fromMap(g))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar album do usuario');
      throw RespositoryException(message: 'Erro ao buscar dados do usuario');
    }
  }

  @override
  Future<StickerModel?> findStickerByCode(
      String stickerCode, String stickerNumber) async {
    try {
      final result =
          await dio.auth().get('/api/sticker-search', queryParameters: {
        'sticker_code': stickerCode,
        'sticker_number': stickerNumber,
      });

      return StickerModel.fromMap(result.data);
    } on DioError catch (e, s) {
      if (e.response?.statusCode == 404) {
        return null;
      }
      log('Erro ao buscar a figurinha', error: e, stackTrace: s);
      throw RespositoryException(message: 'Erro ao buscar figurinha');
    }
  }

  @override
  Future<StickerModel> create(RegisterStickerModel registerStickerModel) async {
    try {
      final body = FormData.fromMap({
        ...registerStickerModel.toMap(),
        'sticker_image_upload': '',
      });
      final result = await dio.auth().post('/api/sticker', data: body);
      return StickerModel.fromMap(result.data);
    } on DioError catch (e, s) {
      log('Erro ao cadastrar figurinha', error: e, stackTrace: s);
      throw RespositoryException(
          message: 'Erro ao cadastrar figuirinha no album');
    }
  }

  @override
  Future<void> registerUserSticker(int stickerId, int amount) async {
    try {
      await dio.auth().post('/api/user/sticker', data: {
        'id_sticker': stickerId,
        'amount': amount,
      });
    } on DioError catch (e) {
      log('Erro ao inserir figurinha no labum do usuario');
      throw RespositoryException(message: 'Erro ao inserir figurinha no album');
    }
  }

  @override
  Future<void> updateUserSticker(int stickerId, int amount) async {
    try {
      await dio.auth().put('/api/user/sticker', data: {
        'id_sticker': stickerId,
        'amount': amount,
      });
    } on DioError catch (e) {
      log('Erro ao inserir figurinha no labum do usuario');
      throw RespositoryException(message: 'Erro ao inserir figurinha no album');
    }
  }
}
