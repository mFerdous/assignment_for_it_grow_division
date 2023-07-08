import '../../data/model/profile_info_request.dart';
import '../repository/last_four_numbers_phone_repository.dart';

class LastFourNumbersPhoneUsecase {
  final LastFourNumbersPhoneRepository _lastFourNumbersPhoneRepository;

  LastFourNumbersPhoneUsecase(this._lastFourNumbersPhoneRepository);

  Future<String> call(ProfileInfoRequest lastFourNumbersPhoneRequest) =>
      _lastFourNumbersPhoneRepository.lastFourNumbersPhone(lastFourNumbersPhoneRequest);
}
