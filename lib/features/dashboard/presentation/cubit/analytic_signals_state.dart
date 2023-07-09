part of 'analytic_signals_cubit.dart';

abstract class AnalyticSignalsApiState extends Equatable {
  const AnalyticSignalsApiState();

  @override
  List<Object> get props => [];
}

class AnalyticSignalsApiInitial extends AnalyticSignalsApiState {}

class AnalyticSignalsLoading extends AnalyticSignalsApiState {}

class AnalyticSignalsFailed extends AnalyticSignalsApiState {
  final StackTrace stackTrace;
  final Object exception;

  const AnalyticSignalsFailed(this.exception, this.stackTrace);
}

class AnalyticSignalsSucceed extends AnalyticSignalsApiState {
  final List<dynamic> model;

  const AnalyticSignalsSucceed({
    required this.model,
  });
}

