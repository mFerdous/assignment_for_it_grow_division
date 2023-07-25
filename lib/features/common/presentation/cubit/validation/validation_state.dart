part of 'validation_cubit.dart';

class ValidationState extends Equatable {
  final UserIdFormz userId;
  final PasswordFormz password;
  final FormzStatus status;

  const ValidationState({
    this.userId = const UserIdFormz.pure(),
    this.password = const PasswordFormz.pure(),
    this.status = FormzStatus.pure,
  });

  ValidationState copyWith({
    UserIdFormz? userId,
    PasswordFormz? password,
    FormzStatus? status,
  }) {
    return ValidationState(
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
  List<Object?> get props => [
        userId,
        password,
        status,
      ];
}

class ValidationInitial extends ValidationState {}

class BoolValue extends ValidationState {
  final bool value;

  const BoolValue(this.value);
}
