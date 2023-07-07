import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../data/model/sign_in_request.dart';
import '../formz/password_formz.dart';
import '../formz/user_id_formz.dart';

part 'sign_in_validation_state.dart';

class SignInValidationCubit extends Cubit<SignInValidationState> {
  SignInValidationCubit() : super(SignInValidationInitial());

  void changeUserId(String value) {
    final userId = UserIdFormz.dirty(value: value);

    emit(state.copyWith(
      userId: userId,
      status: Formz.validate([userId, state.password]),
    ));
  }

  void changePassword(String value) {
    final password = PasswordFormz.dirty(value: value);

    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.userId, password]),
    ));
  }
}
