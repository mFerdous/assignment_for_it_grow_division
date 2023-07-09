

import '../../data/model/analytic_signals_request.dart';
import '../repository/analytic_signals_repository.dart';

class AnalyticSignalsUsecase {
  final AnalyticSignalsRepository _analyticSignalsRepository;

  AnalyticSignalsUsecase(this._analyticSignalsRepository);

  Future<List> call(AnalyticSignalsRequest analyticSignalsRequest) =>
      _analyticSignalsRepository.analyticSignals(analyticSignalsRequest);
}
