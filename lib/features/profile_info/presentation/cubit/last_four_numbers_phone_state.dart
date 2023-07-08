part of 'last_four_numbers_phone_cubit.dart';

abstract class LastFourNumbersPhoneApiState extends Equatable {
  const LastFourNumbersPhoneApiState();

  @override
  List<Object> get props => [];
}

class LastFourNumbersPhoneApiInitial extends LastFourNumbersPhoneApiState {}

class LastFourNumbersPhoneLoading extends LastFourNumbersPhoneApiState {}

class LastFourNumbersPhoneFailed extends LastFourNumbersPhoneApiState {
  final StackTrace stackTrace;
  final Object exception;

  const LastFourNumbersPhoneFailed(this.exception, this.stackTrace);
}

class LastFourNumbersPhoneSucceed extends LastFourNumbersPhoneApiState {
  final String model;

  const LastFourNumbersPhoneSucceed({
    required this.model,
  });
}

