part of 'sign_in_validation_cubit.dart';

class SignInValidationState extends Equatable {
  final UserIdFormz userId;
  final PasswordFormz password;
  final PasswordFormz token;
  final FormzStatus status;

  const SignInValidationState({
    this.userId = const UserIdFormz.pure(),
    this.password = const PasswordFormz.pure(),
    this.token = const PasswordFormz.pure(),
    this.status = FormzStatus.pure,
  });

  SignInValidationState copyWith({
    UserIdFormz? userId,
    PasswordFormz? password,
    PasswordFormz? token,
    FormzStatus? status,
  }) {
    return SignInValidationState(
      userId: userId ?? this.userId,
      password: password ?? this.password,
      token: token ?? this.token,
      status: status ?? this.status,
    );
  }

  SignInRequest getRequestModel() {
    return SignInRequest(
        login: int.parse(userId.value), password: password.value);
  }

  PartnerSignInRequest getPartnerRequestModel() {
    return PartnerSignInRequest(
        login: int.parse(userId.value), password: password.value);
  }

  ProfileInfoRequest getProfileInfoRequestModel() {
    log(userId.value);
    log(token.value);
    return ProfileInfoRequest(
        login: int.parse(userId.value), token: token.value);
  }

  @override
  List<Object> get props => [userId, password, token, status];
}

class SignInValidationInitial extends SignInValidationState {}

class BoolValue extends SignInValidationState {
  final bool value;

  const BoolValue(this.value);
}
