import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../../../common/data/data_source/local/token_source.dart';
import '../../domain/repository/sign_in_repository.dart';
import '../model/sign_in_request.dart';
import '../model/sign_in_response.dart';
import '../remote/sign_in_remote.dart';

class SignInRepositoryImpl implements SignInRepository {
  final ConnectionChecker connectionChecker;
  final SignInRemote signInRemote;
  final TokenSource tokenSource;

  SignInRepositoryImpl(
    this.connectionChecker,
    this.signInRemote,
    this.tokenSource,
  );

  @override
  Future<SignInResponse> signIn(SignInRequest signInRequest) async {
    if (!await connectionChecker.isConnected()) throw NoInternetException();
    SignInResponse signInResponse = await signInRemote.signIn(signInRequest);
    await tokenSource.saveToken(signInResponse.token);
    await tokenSource.saveUserId(signInRequest.login.toString());
    return signInResponse;
  }
}
