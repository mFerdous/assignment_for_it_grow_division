import '../../data/model/sign_in_request.dart';
import '../../data/model/sign_in_response.dart';

abstract class SignInRepository {
  Future<SignInResponse> signin(SignInRequest signInRequest);
}
