import '../../data/model/profile_info_request.dart';

abstract class LastFourNumbersPhoneRepository {
  Future<String> lastFourNumbersPhone(ProfileInfoRequest lastFourNumbersPhoneRequest);
}
