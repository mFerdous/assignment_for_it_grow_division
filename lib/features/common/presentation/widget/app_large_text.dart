import 'package:flutter/material.dart';

import '../../../../core/resources/color_res.dart';
import '../../../../core/utils/lang/app_localizations.dart';

class AppLargeText extends StatelessWidget {
  final String text;
  const AppLargeText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context).translate(text),
      textAlign: TextAlign.left,
      style: const TextStyle(
          color: ColorRes.kSecondaryColor,
          fontSize: 18,
          fontWeight: FontWeight.w600),
    );
  }
}
