import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../dashboard/data/model/analytic_signals_request.dart';
import '../../../../dashboard/presentation/cubit/analytic_signals_cubit.dart';
import '../../../../dashboard/presentation/cubit/formz/currency_pairs_formz.dart';
import '../../../../dashboard/presentation/cubit/formz/date_formz.dart';
import '../../../../profile_info/data/model/profile_info_request.dart';
import '../../../../sign_in/data/model/partner_sign_in_request.dart';
import '../../../../sign_in/data/model/sign_in_request.dart';
import '../../../../sign_in/presentation/cubit/formz/password_formz.dart';
import '../../../../sign_in/presentation/cubit/formz/user_id_formz.dart';

part 'validation_state.dart';

class ValidationCubit extends Cubit<ValidationState> {
  ValidationCubit() : super(ValidationInitial());

  void changeUserId(String value) {
    final userId = UserIdFormz.dirty(value: value);

    emit(state.copyWith(
      userId: userId,
      status: Formz.validate([userId]),
    ));
  }

  void changePassword(String value) {
    final password = PasswordFormz.dirty(value: value);

    emit(state.copyWith(
      password: password,
      status: Formz.validate([password]),
    ));
  }

  void changeToken(String value) {
    final token = PasswordFormz.dirty(value: value);

    emit(state.copyWith(
      token: token,
      status: Formz.validate([token]),
    ));
  }

  void changeCurrencyPairs(String value) {
    final currencyPairs = CurrencyPairsFormz.dirty(value: value);

    emit(state.copyWith(
      currencyPairs: currencyPairs,
      status: Formz.validate([currencyPairs]),
    ));
  }

  void changeFromDate(String value) {
    final fromDate = DateFormz.dirty(value: value);
    emit(state.copyWith(
        fromDate: fromDate,
        status: Formz.validate([
          fromDate,
        ])));
  }

  void changeFrom(String value) {
    final from = DateFormz.dirty(value: value);
    emit(state.copyWith(
        from: from,
        status: Formz.validate([
          from,
        ])));
  }

  void changeToDate(String value) {
    final toDate = DateFormz.dirty(value: value);
    emit(state.copyWith(
        toDate: toDate,
        status: Formz.validate([
          toDate,
        ])));
  }

  void changeTo(String value) {
    final to = DateFormz.dirty(value: value);
    emit(state.copyWith(
        to: to,
        status: Formz.validate([
          to,
        ])));
  }

  void changeTradingsystem(String value) {
    final tradingsystem = UserIdFormz.dirty(value: value);
    emit(state.copyWith(
        tradingsystem: tradingsystem,
        status: Formz.validate([
          tradingsystem,
        ])));
  }

  void changePasskey(String value) {
    final passkey = PasswordFormz.dirty(value: value);

    emit(state.copyWith(
      passkey: passkey,
      status: Formz.validate([passkey]),
    ));
  }

  Future<void> fetchAnalyticSignals(context) async {
    // Retrieve the current state
    final currentState = state;

    // Call the getAnalyticSignals() method to get the request model
    final analyticSignalsRequest = currentState.getAnalyticSignals();

    // Perform any necessary logic or async operations here

    await BlocProvider.of<AnalyticSignalsApiCubit>(context)
        .analyticSignals(analyticSignalsRequest);

    // Transition to a new state if needed
    // For example, you can emit a Loading state before making the API request
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    // Make the API request and handle the response
    // Example: You can use a repository or service to handle the API call
    // and update the state accordingly
    // ...

    // Finally, update the state with the result
    emit(state.copyWith(status: FormzStatus.submissionSuccess));
  }
}
