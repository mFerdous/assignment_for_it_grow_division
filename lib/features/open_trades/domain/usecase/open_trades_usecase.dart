

import '../../data/model/open_trades_response.dart';
import '../repository/open_trades_repository.dart';

class OpenTradesUsecase {
  final OpenTradesRepository _openTradesRepository;

  OpenTradesUsecase(this._openTradesRepository);

  Future<List<OpenTradesResponse>> call() =>
      _openTradesRepository.openTrades();
}
