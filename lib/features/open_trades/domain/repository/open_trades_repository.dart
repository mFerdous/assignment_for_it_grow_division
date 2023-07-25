

import '../../data/model/open_trades_response.dart';

abstract class OpenTradesRepository {
  Future<List<OpenTradesResponse>> openTrades();
}
