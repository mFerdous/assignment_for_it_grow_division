// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/analytic_signals_request.dart';
import '../../domain/usecase/analytic_signals_usecase.dart';

part 'analytic_signals_state.dart';

class AnalyticSignalsApiCubit extends Cubit<AnalyticSignalsApiState> {
  final AnalyticSignalsUsecase analyticSignalsUsecase;

  AnalyticSignalsApiCubit({
    required this.analyticSignalsUsecase,
  }) : super(AnalyticSignalsApiInitial());

  Future<void> analyticSignals(AnalyticSignalsRequest requestModel) async {
    try {
      emit(AnalyticSignalsLoading());

      final responseModel = await analyticSignalsUsecase(requestModel);

      emit(AnalyticSignalsSucceed(model: responseModel));
    } catch (ex, strackTrace) {
      emit(AnalyticSignalsFailed(ex, strackTrace));
    }
  }
}
