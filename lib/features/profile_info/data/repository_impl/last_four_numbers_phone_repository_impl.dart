import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../../domain/repository/last_four_numbers_phone_repository.dart';
import '../remote/last_four_numbers_phone_remote.dart';

class LastFourNumbersPhoneRepositoryImpl implements LastFourNumbersPhoneRepository {
  final ConnectionChecker connectionChecker;
  final LastFourNumbersPhoneRemote lastFourNumbersPhoneRemote;

  LastFourNumbersPhoneRepositoryImpl(
    this.connectionChecker,
    this.lastFourNumbersPhoneRemote,
  );

  @override
  Future<String> lastFourNumbersPhone() async {
    if (!await connectionChecker.isConnected()) throw NoInternetException();
    String lastFourNumbersPhoneResponse = await lastFourNumbersPhoneRemote.lastFourNumbersPhone();
    return lastFourNumbersPhoneResponse;
  }
}
