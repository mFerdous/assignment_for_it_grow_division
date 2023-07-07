part of 'partner_sign_in_cubit.dart';

abstract class PartnerSignInApiState extends Equatable {
  const PartnerSignInApiState();

  @override
  List<Object> get props => [];
}

class PartnerSignInApiInitial extends PartnerSignInApiState {}

class PartnerSignInLoading extends PartnerSignInApiState {}

class PartnerSignInFailed extends PartnerSignInApiState {
  final StackTrace stackTrace;
  final Object exception;

  const PartnerSignInFailed(this.exception, this.stackTrace);
}

class PartnerSignInSucceed extends PartnerSignInApiState {
  final String model;

  const PartnerSignInSucceed({
    required this.model,
  });
}

