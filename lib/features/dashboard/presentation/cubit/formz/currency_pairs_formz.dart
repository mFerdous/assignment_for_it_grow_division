
import 'package:formz/formz.dart';

class CurrencyPairsFormz extends FormzInput<String, String> {
  const CurrencyPairsFormz.pure() : super.pure('');

  const CurrencyPairsFormz.dirty({String value = ''}) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      //return ErrorMsgRes.kNameRequired;
      return null;
    } else {
      return null;
    }
  }
}
