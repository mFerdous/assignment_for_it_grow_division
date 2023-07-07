import 'package:flutter/material.dart';
import 'package:test_task/core/resources/export_resources.dart';
import 'package:test_task/core/utils/lang/app_localizations.dart';
import 'package:test_task/core/utils/lang/size_config.dart';

class AppBulletPointText extends StatelessWidget {
  final String text;

  const AppBulletPointText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: getProportionateScreenHeight(12)),
          height: 4,
          width: 4,
          decoration: BoxDecoration(
              color: ColorRes.kBlackColor,
              borderRadius: BorderRadius.circular(2)),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            AppLocalizations.of(context).translate(text),
            textAlign: TextAlign.left,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 1.5,
                color: ColorRes.kBlackColor),
          ),
        )
      ],
    );
  }
}
