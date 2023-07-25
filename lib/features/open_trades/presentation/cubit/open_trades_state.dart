part of 'open_trades_cubit.dart';

abstract class OpenTradesApiState extends Equatable {
  const OpenTradesApiState();

  @override
  List<Object> get props => [];
}

class OpenTradesApiInitial extends OpenTradesApiState {}

class OpenTradesLoading extends OpenTradesApiState {}

class OpenTradesFailed extends OpenTradesApiState {
  final StackTrace stackTrace;
  final Object exception;

  const OpenTradesFailed(this.exception, this.stackTrace);
}

class OpenTradesSucceed extends OpenTradesApiState {
  final List<OpenTradesResponse> model;

  const OpenTradesSucceed({
    required this.model,
  });
}

