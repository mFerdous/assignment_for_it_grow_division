import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../../domain/repository/analytic_signals_repository.dart';
import '../model/analytic_signals_request.dart';
import '../remote/analytic_signals_remote.dart';

class AnalyticSignalsRepositoryImpl implements AnalyticSignalsRepository {
  final ConnectionChecker connectionChecker;
  final AnalyticSignalsRemote analyticSignalsRemote;

  AnalyticSignalsRepositoryImpl(
    this.connectionChecker,
    this.analyticSignalsRemote,
  );

  @override
  Future<List> analyticSignals(AnalyticSignalsRequest analyticSignalsRequest) async {
    if (!await connectionChecker.isConnected()) throw NoInternetException();
    List analyticSignalsResponse = await analyticSignalsRemote.analyticSignals(analyticSignalsRequest);
    return analyticSignalsResponse;
  }
}
