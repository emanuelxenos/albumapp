import 'package:albumapp/app/core/ui/styles/button_styles.dart';
import 'package:albumapp/app/core/ui/styles/text_styles.dart';
import 'package:albumapp/app/core/ui/widgets/rounded_button.dart';
import 'package:albumapp/app/pages/sticker_detail/presenter/sticker_detail_presenter.dart';
import 'package:albumapp/app/pages/sticker_detail/view/sticker_detail_view_impl.dart';
import 'package:flutter/material.dart';

import '../../core/ui/widgets/button.dart';

class StickerDetailPage extends StatefulWidget {
  final StickerDetailPresenter presenter;

  const StickerDetailPage({super.key, required this.presenter});

  @override
  State<StickerDetailPage> createState() => _StickerDetailPageState();
}

class _StickerDetailPageState extends StickerDetailViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe da figuriha'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(hasSticker
                  ? 'assets/images/sticker.png'
                  : 'assets/images/sticker_pb.png'),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '$countryCode $stickerNumber',
                      style: context.textStyles.textPrimaryFontBold
                          .copyWith(fontSize: 22),
                    ),
                  ),
                  const Spacer(),
                  RoundedButton(
                      onPressed: widget.presenter.decrementAmount,
                      icon: Icons.remove),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      amount.toString(),
                      style: context.textStyles.textSecondaryFontMedium,
                    ),
                  ),
                  RoundedButton(
                      onPressed: widget.presenter.incrementAmount,
                      icon: Icons.add),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, bottom: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  countryName,
                  style: context.textStyles.textPrimaryFontRegular,
                ),
              ),
              Button.primary(
                label:
                    hasSticker ? 'Atualizar Figurinha' : 'Adicionar figurinha',
                onPressed: widget.presenter.saveSticker,
                width: MediaQuery.of(context).size.width * .9,
              ),
              Button(
                onPressed: widget.presenter.deleteSticker,
                style: context.buttonStyles.primaryOutlineButton,
                labelStyle:
                    context.textStyles.textSecondaryFontExtraBoldPrimaryColor,
                label: 'Excluir figurinha',
                outline: true,
                width: MediaQuery.of(context).size.width * .9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
