import '../../data/model/partner_sign_in_request.dart';

abstract class PartnerSignInRepository {
  Future<String> partnerSignIn(PartnerSignInRequest partnerSignInRequest);
}
