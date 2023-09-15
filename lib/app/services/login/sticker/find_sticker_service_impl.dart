import 'package:albumapp/app/models/register_sticker_model.dart';
import 'package:albumapp/app/models/sticker_model.dart';
import 'package:albumapp/app/repository/auth/stickers/stickers_repository.dart';

import './find_sticker_service.dart';

class FindStickerServiceImpl implements FindStickerService {
  final StickersRepository stickersRepository;

  FindStickerServiceImpl({
    required this.stickersRepository,
  });

  @override
  Future<StickerModel> execute(String countryCode, String stickerNumber) async {
    var sticker =
        await stickersRepository.findStickerByCode(countryCode, stickerNumber);

    if (sticker == null) {
      final registerSticker = RegisterStickerModel(
        name: '',
        stickerCode: countryCode,
        stickerNumber: stickerNumber,
      );
      sticker = await stickersRepository.create(registerSticker);
    }

    return sticker;
  }
}
