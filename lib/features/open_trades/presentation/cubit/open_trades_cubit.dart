// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/open_trades_response.dart';
import '../../domain/usecase/open_trades_usecase.dart';

part 'open_trades_state.dart';

class OpenTradesApiCubit extends Cubit<OpenTradesApiState> {
  final OpenTradesUsecase openTradesUsecase;

  OpenTradesApiCubit({
    required this.openTradesUsecase,
  }) : super(OpenTradesApiInitial());

  Future<void> openTrades() async {
    try {
      emit(OpenTradesLoading());

      final responseModel = await openTradesUsecase();

      emit(OpenTradesSucceed(model: responseModel));
    } catch (ex, strackTrace) {
      emit(OpenTradesFailed(ex, strackTrace));
    }
  }
}
