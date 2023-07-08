

import '../../data/model/profile_info_request.dart';
import '../../data/model/profile_info_response.dart';
import '../repository/profile_info_repository.dart';

class ProfileInfoUsecase {
  final ProfileInfoRepository _profileInfoRepository;

  ProfileInfoUsecase(this._profileInfoRepository);

  Future<ProfileInfoResponse> call(ProfileInfoRequest profileInfoRequest) =>
      _profileInfoRepository.profileInfo(profileInfoRequest);
}
