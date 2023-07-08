

import '../../data/model/profile_info_request.dart';
import '../../data/model/profile_info_response.dart';

abstract class ProfileInfoRepository {
  Future<ProfileInfoResponse> profileInfo(ProfileInfoRequest profileInfoRequest);
}
