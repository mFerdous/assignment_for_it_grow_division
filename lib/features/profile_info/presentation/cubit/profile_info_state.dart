part of 'profile_info_cubit.dart';

abstract class ProfileInfoApiState extends Equatable {
  const ProfileInfoApiState();

  @override
  List<Object> get props => [];
}

class ProfileInfoApiInitial extends ProfileInfoApiState {}

class ProfileInfoLoading extends ProfileInfoApiState {}

class ProfileInfoFailed extends ProfileInfoApiState {
  final StackTrace stackTrace;
  final Object exception;

  const ProfileInfoFailed(this.exception, this.stackTrace);
}

class ProfileInfoSucceed extends ProfileInfoApiState {
  final ProfileInfoResponse model;

  const ProfileInfoSucceed({
    required this.model,
  });
}

