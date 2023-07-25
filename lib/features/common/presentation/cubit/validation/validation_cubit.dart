import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../sign_in/data/model/sign_in_request.dart';
import '../../../../sign_in/presentation/cubit/formz/password_formz.dart';
import '../../../../sign_in/presentation/cubit/formz/user_id_formz.dart';

part 'validation_state.dart';

class ValidationCubit extends Cubit<ValidationState> {
  ValidationCubit() : super(ValidationInitial());

  void changeUserId(String value) {
    final userId = UserIdFormz.dirty(value: value);

    emit(state.copyWith(
      userId: userId,
      status: Formz.validate([userId]),
    ));
  }

  void changePassword(String value) {
    final password = PasswordFormz.dirty(value: value);

    emit(state.copyWith(
      password: password,
      status: Formz.validate([password]),
    ));
  }
}
