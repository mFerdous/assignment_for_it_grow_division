import '../../data/model/sign_in_request.dart';
import '../../data/model/sign_in_response.dart';
import '../repository/sign_in_repository.dart';

class SignInUsecase {
  final SignInRepository _signInRepository;

  SignInUsecase(this._signInRepository);

  Future<SignInResponse> call(SignInRequest signInRequest) =>
      _signInRepository.signIn(signInRequest);
}
