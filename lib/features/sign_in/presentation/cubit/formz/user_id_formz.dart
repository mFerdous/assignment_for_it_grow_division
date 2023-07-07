import 'package:formz/formz.dart';

import '../../../../../core/resources/error_msg_res.dart';

class UserIdFormzError {
  final String message;

  const UserIdFormzError(this.message);
}

class UserIdFormz extends FormzInput<String, UserIdFormzError> {
  const UserIdFormz.pure() : super.pure('');

  const UserIdFormz.dirty({String value = ''}) : super.dirty(value);

  @override
  UserIdFormzError? validator(String value) {
    if (value.isEmpty) {
      return const UserIdFormzError(ErrorMsgRes.kUserIdRequired);
    } else {
      return null;
    }
  }
}
