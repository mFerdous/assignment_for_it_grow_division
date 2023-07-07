part of 'sign_in_validation_cubit.dart';

class SignInValidationState extends Equatable {
  final UserIdFormz userId;
  final PasswordFormz password;
  final FormzStatus status;

  const SignInValidationState({
    this.userId = const UserIdFormz.pure(),
    this.password = const PasswordFormz.pure(),
    this.status = FormzStatus.pure,
  });

  SignInValidationState copyWith({
    UserIdFormz? userId,
    PasswordFormz? password,
    FormzStatus? status,
  }) {
    return SignInValidationState(
      userId: userId ?? this.userId,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  SignInRequest getRequestModel() {
    return SignInRequest(
        login: int.parse(userId.value), password: password.value);
  }

  @override
  List<Object> get props => [userId, password, status];
}

class SignInValidationInitial extends SignInValidationState {}

class BoolValue extends SignInValidationState {
  final bool value;

  BoolValue(this.value);
}
