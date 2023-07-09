import 'package:flutter/material.dart';

import '../../../../core/utils/lang/app_localizations.dart';

class AppTextFieldDropdown extends StatelessWidget {
  final String labelText;
  final String? errorText;
  final String value;
  final bool readOnly;
  
  final VoidCallback? onTap;

  final TextEditingController controller = TextEditingController();
  final TextInputAction? textInputAction;

  AppTextFieldDropdown({
    Key? key,
    required this.labelText,
    this.errorText,
    this.value = '',
    this.onTap,
    this.readOnly = false,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.text = value;

    return SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.only(left: 15, right: 0),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF456B35), width: 0.5),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: TextFormField(
                readOnly: readOnly,
                textInputAction: textInputAction,
                controller: controller,
                enabled: false,
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xFF456B35),
                  ),
                  labelText: AppLocalizations.of(context).translate(labelText),
                  border: InputBorder.none,
                  labelStyle:
                      const TextStyle(color: Color.fromRGBO(17, 36, 10, 0.75)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              AppLocalizations.of(context).translate(errorText ?? ''),
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w500,
                fontSize: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
