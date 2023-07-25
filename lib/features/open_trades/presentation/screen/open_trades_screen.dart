import 'dart:convert';
import 'dart:developer';

import 'package:test_task/core/exceptions/exceptions.dart';
import 'package:test_task/core/utils/lang/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:test_task/features/open_trades/presentation/cubit/open_trades_cubit.dart';

import '../../../../core/resources/export_resources.dart';
import '../../../common/presentation/widget/drawer.dart';
import '../../data/model/open_trades_response.dart';

class OpenTradesScreen extends StatefulWidget {
  const OpenTradesScreen({super.key});

  @override
  State<OpenTradesScreen> createState() =>
      _OpenTradesScreenState();
}

class _OpenTradesScreenState
    extends State<OpenTradesScreen> {
  @override
  void initState() {
    super.initState();
    getOpenTrades();
  }

  getOpenTrades() async {
    await BlocProvider.of<OpenTradesApiCubit>(context)
        .openTrades();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context).locale.languageCode;
    // isLangBangla = locale.contains('bn');

    return BlocBuilder<OpenTradesApiCubit,
            OpenTradesApiState>(
        builder: (ctx, OpenTradesApiState state) {
      switch (state.runtimeType) {
        case OpenTradesSucceed:
          List<OpenTradesResponse>? openTradesResponse =
              (state as OpenTradesSucceed).model;
          return Scaffold(
      drawer: DrawerWidgets(),
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('open_trades'),
        ),
        centerTitle: true,
        backgroundColor: ColorRes.kSecondaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: openTradesResponse.length,
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(height: 10),
          itemBuilder: (BuildContext context, int index) {
            final trade = openTradesResponse[index];

            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              // color: backgroundColor,
              child: ListTile(
                // title: Text(
                //   trade.symbol != null ? trade.symbol.toString() : '',
                //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow('Current Price', trade.currentPrice),
                    Divider(
                      thickness: 1,
                    ),
                    _buildInfoRow('Comment', trade.comment),
                    Divider(
                      thickness: 1,
                    ),
                    _buildInfoRow('Digits', trade.digits),
                    Divider(
                      thickness: 1,
                    ),
                    _buildInfoRow('Login', trade.login),
                    Divider(
                      thickness: 1,
                    ),
                    _buildInfoRow('Open Price', trade.openPrice),
                    Divider(
                      thickness: 1,
                    ),
                    _buildInfoRow('Open Time', trade.openTime),
                    Divider(
                      thickness: 1,
                    ),
                    _buildInfoRow('Profit', trade.profit),
                    Divider(
                      thickness: 1,
                    ),
                    _buildInfoRow('Sl', trade.sl),
                    Divider(
                      thickness: 1,
                    ),
                    _buildInfoRow('Swaps', trade.swaps),
                    Divider(
                      thickness: 1,
                    ),
                    _buildInfoRow('Swaps', trade.symbol),
                    Divider(
                      thickness: 1,
                    ),
                    _buildInfoRow('Tp', trade.tp),
                    Divider(
                      thickness: 1,
                    ),
                    _buildInfoRow('Ticket', trade.ticket),
                    Divider(
                      thickness: 1,
                    ),
                    _buildInfoRow('Type', trade.type),
                    Divider(
                      thickness: 1,
                    ),
                    _buildInfoRow('Volume', trade.volume),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  
        case OpenTradesLoading:
          return Center(
            child: LoadingAnimationWidget.discreteCircle(
              color: Colors.white.withOpacity(0.5),
              size: 50,
            ),
          );
        case OpenTradesFailed:
          final ex = (state as OpenTradesFailed).exception;
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


  Widget _buildInfoRow(String label, dynamic value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            value != null ? value.toString() : '',
            style: TextStyle(color: Colors.grey[700]),
          ),
        ),
      ],
    );
  }
}
