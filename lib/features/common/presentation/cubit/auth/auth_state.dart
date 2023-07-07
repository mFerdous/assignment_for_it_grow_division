part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class SignOutLoading extends AuthState {}

class SignOutSuccess extends AuthState {
  final String message;

  const SignOutSuccess({
    required this.message,
  });
}

class SignOutFailed extends AuthState {
  final Object exception;
  final StackTrace stackTrace;

  const SignOutFailed({
    required this.exception,
    required this.stackTrace,
  });
}
