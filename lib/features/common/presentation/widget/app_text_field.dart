import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/resources/color_res.dart';
import '../../../../core/utils/lang/app_localizations.dart';

class AppTextField extends StatelessWidget {
  final String labelText;
  final String? errorText;
  final TextInputType keyboardType;
  final bool readOnly;
  final Function(String)? onChange;
  final List<TextInputFormatter>? inputFormatters;

  final TextEditingController? controller;

  const AppTextField({
    Key? key,
    required this.labelText,
    this.errorText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.onChange,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 15, right: 0),
          decoration: BoxDecoration(
            border: Border.all(color: ColorRes.kSecondaryColor, width: 0.5),
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: TextFormField(
            readOnly: readOnly,
            controller: controller,

            onChanged: (value) {
              if (onChange != null) {
                onChange!(value);
              }
            },
            // validator: validator,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,

            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).translate(labelText),
              border: InputBorder.none,
              labelStyle: const TextStyle(
                  color: Color.fromRGBO(17, 36, 10, 0.75),
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            // errorText ?? '',
            AppLocalizations.of(context).translate(errorText ?? ''),
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w500,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}
