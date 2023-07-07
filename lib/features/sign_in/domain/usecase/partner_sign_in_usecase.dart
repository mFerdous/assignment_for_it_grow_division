import '../../data/model/partner_sign_in_request.dart';
import '../repository/partner_sign_in_repository.dart';

class PartnerSignInUsecase {
  final PartnerSignInRepository _partnerSignInRepository;

  PartnerSignInUsecase(this._partnerSignInRepository);

  Future<String> call(PartnerSignInRequest partnerSignInRequest) =>
      _partnerSignInRepository.partnerSignIn(partnerSignInRequest);
}
