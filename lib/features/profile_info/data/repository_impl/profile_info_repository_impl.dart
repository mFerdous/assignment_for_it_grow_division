import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../../domain/repository/profile_info_repository.dart';
import '../model/profile_info_response.dart';
import '../remote/profile_info_remote.dart';

class ProfileInfoRepositoryImpl implements ProfileInfoRepository {
  final ConnectionChecker connectionChecker;
  final ProfileInfoRemote profileInfoRemote;

  ProfileInfoRepositoryImpl(
    this.connectionChecker,
    this.profileInfoRemote,
  );

  @override
  Future<ProfileInfoResponse> profileInfo() async {
    if (!await connectionChecker.isConnected()) throw NoInternetException();
    ProfileInfoResponse profileInfoResponse = await profileInfoRemote.profileInfo();
    return profileInfoResponse;
  }
}
