import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_task/core/resources/export_resources.dart';
import 'package:test_task/core/utils/lang/app_localizations.dart';

Color _iconColor = const Color(0xFFB8BDB6);

class AppPasswordTextField extends StatefulWidget {
  final String labelText;
  final String? errorText;
  final TextInputType keyboardType;
  // final String? Function(String?) validator;
  final Function(String)? onChange;

  final List<TextInputFormatter>? inputFormatters;

  final TextEditingController? controller;

  const AppPasswordTextField({
    Key? key,
    required this.labelText,
    this.errorText,
    this.controller,
    this.keyboardType = TextInputType.text,
    // this.validator,
    this.onChange,
    this.inputFormatters,
  }) : super(key: key);

  @override
  State<AppPasswordTextField> createState() => _AppPasswordTextFieldState();
}

class _AppPasswordTextFieldState extends State<AppPasswordTextField> {
  bool _obsecureText = true;

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
            obscureText: _obsecureText,
            controller: widget.controller,

            onChanged: (value) {
              if (widget.onChange != null) {
                widget.onChange!(value);
              }
            },
            // validator: validator,
            inputFormatters: widget.inputFormatters,
            keyboardType: widget.keyboardType,
            obscuringCharacter: '●',
            decoration: InputDecoration(
              labelText:
                  AppLocalizations.of(context).translate(widget.labelText),
              border: InputBorder.none,
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obsecureText = !_obsecureText;
                    });
                  },
                  icon: _obsecureText
                      ? Icon(Icons.visibility_off, color: _iconColor)
                      : Icon(Icons.visibility, color: _iconColor)),
              labelStyle: const TextStyle(
                  color: Color.fromRGBO(17, 36, 10, 0.75),
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
        const SizedBox(height: 5),

        //
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            AppLocalizations.of(context).translate(widget.errorText ?? ''),
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
