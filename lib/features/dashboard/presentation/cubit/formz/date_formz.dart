
import 'package:formz/formz.dart';


class DateFormz extends FormzInput<String, String> {
  const DateFormz.pure() : super.pure('');

  const DateFormz.dirty({String value = ''}) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return null;
      // ErrorMsgRes.kPostOfficeRequired;
    } else {
      return null;
    }
  }
}
