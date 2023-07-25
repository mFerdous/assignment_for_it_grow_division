import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../../domain/repository/open_trades_repository.dart';
import '../model/open_trades_response.dart';
import '../remote/open_trades_remote.dart';

class OpenTradesRepositoryImpl implements OpenTradesRepository {
  final ConnectionChecker connectionChecker;
  final OpenTradesRemote openTradesRemote;

  OpenTradesRepositoryImpl(
    this.connectionChecker,
    this.openTradesRemote,
  );

  @override
  Future<List<OpenTradesResponse>> openTrades() async {
    if (!await connectionChecker.isConnected()) throw NoInternetException();
    List<OpenTradesResponse> openTradesResponse = await openTradesRemote.openTrades();
    return openTradesResponse;
  }
}
