part of 'validation_cubit.dart';

class ValidationState extends Equatable {
  final UserIdFormz userId;
  final PasswordFormz password;
  final PasswordFormz token;
  final CurrencyPairsFormz currencyPairs;
  final DateFormz fromDate;
  final DateFormz from;
  final DateFormz toDate;
  final DateFormz to;
  final UserIdFormz tradingsystem;
  final PasswordFormz passkey;
  final FormzStatus status;

  const ValidationState({
    this.userId = const UserIdFormz.pure(),
    this.password = const PasswordFormz.pure(),
    this.token = const PasswordFormz.pure(),
    this.currencyPairs = const CurrencyPairsFormz.pure(),
    this.fromDate = const DateFormz.pure(),
    this.from = const DateFormz.pure(),
    this.toDate = const DateFormz.pure(),
    this.to = const DateFormz.pure(),
    this.tradingsystem = const UserIdFormz.pure(),
    this.passkey = const PasswordFormz.pure(),
    this.status = FormzStatus.pure,
  });

  ValidationState copyWith({
    UserIdFormz? userId,
    PasswordFormz? password,
    PasswordFormz? token,
    CurrencyPairsFormz? currencyPairs,
    DateFormz? fromDate,
    DateFormz? from,
    DateFormz? toDate,
    DateFormz? to,
    UserIdFormz? tradingsystem,
    PasswordFormz? passkey,
    FormzStatus? status,
  }) {
    return ValidationState(
      userId: userId ?? this.userId,
      password: password ?? this.password,
      token: token ?? this.token,
      currencyPairs: currencyPairs ?? this.currencyPairs,
      fromDate: fromDate ?? this.fromDate,
      from: from ?? this.from,
      toDate: toDate ?? this.toDate,
      to: to ?? this.to,
      tradingsystem: tradingsystem ?? this.tradingsystem,
      passkey: passkey ?? this.passkey,
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
    return ProfileInfoRequest(
        login: int.parse(userId.value), token: token.value);
  }

  AnalyticSignalsRequest getAnalyticSignals() {
    return AnalyticSignalsRequest(
        tradingsystem: int.parse(tradingsystem.value),
        from:int.parse(from.value),
        to: int.parse(to.value),
        pairs: currencyPairs.value,
        loginId: userId.value,
        passkey: passkey.value);
  }

  @override
  List<Object> get props => [
        userId,
        password,
        token,
        currencyPairs,
        fromDate,
        from,
        toDate,
        to,
        tradingsystem,
        passkey,
        status,
      ];
}

class ValidationInitial extends ValidationState {}

class BoolValue extends ValidationState {
  final bool value;

  const BoolValue(this.value);
}
