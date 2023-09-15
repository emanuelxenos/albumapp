import 'package:flutter/material.dart';

import 'package:albumapp/app/core/ui/styles/colors_app.dart';
import 'package:albumapp/app/core/ui/styles/text_styles.dart';

class StatusTile extends StatelessWidget {
  final String icon;
  final String label;
  final int value;

  const StatusTile({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .7,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SizedBox(
          width: 46,
          child: CircleAvatar(
            radius: 46,
            backgroundColor: context.colors.grey,
            child: Image.asset('assets/images/$icon'),
          ),
        ),
        title: Text(
          label,
          style: context.textStyles.textPrimaryFontRegular
              .copyWith(color: Colors.white),
        ),
        trailing: Text(
          "$value",
          style: context.textStyles.textPrimaryFontMedium
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
