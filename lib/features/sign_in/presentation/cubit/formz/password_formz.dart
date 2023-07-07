import 'package:formz/formz.dart';

import '../../../../../core/resources/error_msg_res.dart';

class PasswordFormzError {
  final String message;

  PasswordFormzError(this.message);
}

class PasswordFormz extends FormzInput<String, PasswordFormzError> {
  const PasswordFormz.pure() : super.pure('');

  const PasswordFormz.dirty({String value = ''}) : super.dirty(value);

  @override
  PasswordFormzError? validator(String value) {
    if (value.isEmpty) {
      return PasswordFormzError(ErrorMsgRes.kPasswordRequired);
    } else {
      return null;
    }
  }
}
