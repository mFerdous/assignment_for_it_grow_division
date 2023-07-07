import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/core/resources/export_resources.dart';
import 'package:test_task/features/common/presentation/cubit/locale/locale_cubit.dart';

class LanguageSwitchButton extends StatelessWidget {
  final selectedBgColor = ColorRes.kButtonBG;
  final unselectedBgColor = const Color(0xFFFFE7C0);

  final unselectedTextColor = ColorRes.kSecondaryColor;
  final selectedTextColor = const Color(0xFF4F4F4F);

  const LanguageSwitchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        return Row(children: [
          _buildBnLangButton(context, state.langCode),
          _buildEnLangButton(context, state.langCode),
        ]);
      },
    );
  }

  _buildBnLangButton(BuildContext context, String langCode) {
    var borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(3),
      bottomLeft: Radius.circular(3),
    );

    final Color bgColor =
        langCode == StringRes.kLangCodeBN ? selectedBgColor : unselectedBgColor;
    final Color textColor = langCode == StringRes.kLangCodeBN
        ? selectedTextColor
        : unselectedTextColor;
    final fontWeight =
        langCode == StringRes.kLangCodeBN ? FontWeight.w500 : FontWeight.w400;

    return InkWell(
      onTap: () {
        context.read<LocaleCubit>().changeLanguageToBangla();
      },
      child: Container(
        width: 40,
        height: 25,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: borderRadius,
        ),
        child: Center(
          child: Text(
            'বাং',
            style: TextStyle(
                fontSize: 12, color: textColor, fontWeight: fontWeight),
          ),
        ),
      ),
    );
  }

  _buildEnLangButton(BuildContext context, String langCode) {
    var borderRadius = const BorderRadius.only(
      topRight: Radius.circular(3),
      bottomRight: Radius.circular(3),
    );

    final Color bgColor =
        langCode == StringRes.kLangCodeEN ? selectedBgColor : unselectedBgColor;
    final Color textColor = langCode == StringRes.kLangCodeEN
        ? selectedTextColor
        : unselectedTextColor;
    final fontWeight =
        langCode == StringRes.kLangCodeEN ? FontWeight.w500 : FontWeight.w400;

    return InkWell(
      onTap: () {
        context.read<LocaleCubit>().changeLanguageToEnglish();
      },
      child: Container(
        width: 40,
        height: 25,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: borderRadius,
        ),
        child: Center(
          child: Text(
            'EN',
            style: TextStyle(
                fontSize: 12, color: textColor, fontWeight: fontWeight),
          ),
        ),
      ),
    );
  }
}
