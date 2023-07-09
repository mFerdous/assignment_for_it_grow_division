import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_task/features/dashboard/presentation/widget/dashboard.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../common/presentation/cubit/validation/validation_cubit.dart';
import '../../data/model/analytic_signals_request.dart';
import '../../data/model/analytic_signals_response.dart';
import '../cubit/analytic_signals_cubit.dart';

class AnalyticSignalsScreen extends StatefulWidget {
  const AnalyticSignalsScreen({super.key});

  @override
  State<AnalyticSignalsScreen> createState() => _AnalyticSignalsScreenState();
}

class _AnalyticSignalsScreenState extends State<AnalyticSignalsScreen> {
  String? userId;
  String? token;
  String? partnerToken;
  AnalyticSignalsRequest analyticSignalsRequest = AnalyticSignalsRequest(
      tradingsystem: 3,
      from: 1479860023,
      to: 1480066860,
      pairs: 'GBPJPY',
      loginId: '',
      passkey: '');

  getSignInResponse() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      userId = sharedPreferences.getString("user_id");
      token = sharedPreferences.getString("access_token");
      partnerToken = sharedPreferences.getString("partner_token");

      context.read<ValidationCubit>().changeUserId(userId!);
      context.read<ValidationCubit>().changeToken(token!);
      context.read<ValidationCubit>().changeTradingsystem('3');
      context.read<ValidationCubit>().changeFrom('1479860023');
      context.read<ValidationCubit>().changeTo('1480066860');
      context.read<ValidationCubit>().changeCurrencyPairs('GBPJPY');
      context.read<ValidationCubit>().changePasskey(partnerToken!);
      analyticSignalsRequest.loginId = userId!;
      analyticSignalsRequest.passkey = partnerToken!;
    });
    gitAnalyticSignals();
  }

  gitAnalyticSignals() async {
    await BlocProvider.of<AnalyticSignalsApiCubit>(context)
        .analyticSignals(analyticSignalsRequest);
  }

  @override
  void initState() {
    super.initState();
    getSignInResponse();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyticSignalsApiCubit, AnalyticSignalsApiState>(
        builder: (ctx, AnalyticSignalsApiState state) {
      switch (state.runtimeType) {
        case AnalyticSignalsSucceed:
          List analyticSignalsResponse =
              (state as AnalyticSignalsSucceed).model;
          // log(json.encode(analyticSignalsResponse));
          return Dashboard(
            analyticSignalsResponse: analyticSignalsResponse,
          );
        case AnalyticSignalsLoading:
          return Center(
            child: LoadingAnimationWidget.discreteCircle(
              color: Colors.white.withOpacity(0.5),
              size: 50,
            ),
          );
        case AnalyticSignalsFailed:
          final ex = (state as AnalyticSignalsFailed).exception;
          if (ex is ServerException) {
            return Center(child: Text(ex.message ?? ''));
          } else {
            return Center(child: Text(" Went Wrong"));
          }

        default:
          return Center(child: Text("Something Went Wrong; try again"));
      }
    });
  }
}
