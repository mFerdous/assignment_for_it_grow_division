import '../repository/last_four_numbers_phone_repository.dart';

class LastFourNumbersPhoneUsecase {
  final LastFourNumbersPhoneRepository _lastFourNumbersPhoneRepository;

  LastFourNumbersPhoneUsecase(this._lastFourNumbersPhoneRepository);

  Future<String> call() =>
      _lastFourNumbersPhoneRepository.lastFourNumbersPhone();
}
