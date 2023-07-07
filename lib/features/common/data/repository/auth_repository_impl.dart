

import '../../domain/repository/auth_repository.dart';
import '../data_source/remote/auth_remote.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemote remote;

  AuthRepositoryImpl({
    required this.remote,
  });

  @override
  Future<String> signOut() async {
    return await remote.signOut();
  }
}
