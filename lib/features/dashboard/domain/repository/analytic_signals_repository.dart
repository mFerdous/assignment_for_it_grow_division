

import '../../data/model/analytic_signals_request.dart';

abstract class AnalyticSignalsRepository {
  Future<List> analyticSignals(AnalyticSignalsRequest analyticSignalsRequest);
}
