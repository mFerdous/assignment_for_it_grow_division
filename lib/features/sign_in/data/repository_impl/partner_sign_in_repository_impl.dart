import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../../../common/data/data_source/local/partner_token_source.dart';
import '../../domain/repository/partner_sign_in_repository.dart';
import '../model/partner_sign_in_request.dart';
import '../remote/partner_sign_in_remote.dart';

class PartnerSignInRepositoryImpl implements PartnerSignInRepository {
  final ConnectionChecker connectionChecker;
  final PartnerSignInRemote partnerSignInRemote;
  final PartnerTokenSource partnerTokenSource;

  PartnerSignInRepositoryImpl(
    this.connectionChecker,
    this.partnerSignInRemote,
    this.partnerTokenSource,
  );

  @override
  Future<String> partnerSignIn(PartnerSignInRequest partnerSignInRequest) async {
    if (!await connectionChecker.isConnected()) throw NoInternetException();
    String partnerSignInResponse = await partnerSignInRemote.partnerSignIn(partnerSignInRequest);
    await partnerTokenSource.savePartnerToken(partnerSignInResponse);
    return partnerSignInResponse;
  }
}
