// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../core/navigation/route_name.dart';
import '../../../../core/resources/color_res.dart';
import '../../../../core/utils/lang/app_localizations.dart';
import '../../../common/presentation/widget/app_text_field.dart';
import '../../../common/presentation/widget/language_switch_button.dart';
import '../../../dashboard/presentation/widget/dashboard.dart';
import '../../data/model/profile_info_response.dart';

class ProfileInfoScreen extends StatelessWidget {
  final ProfileInfoResponse response;
  final String? lastFourNumbersPhone;
  const ProfileInfoScreen({
    Key? key,
    required this.response,
    this.lastFourNumbersPhone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('profile_info'),
        ),
        centerTitle: true,
        backgroundColor: ColorRes.kSecondaryColor,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
            
        //     Navigator.pushNamed(
        //       context, RouteName.kDashboardRoute);
        //   },
        // ),
        actions: const [
          LanguageSwitchButton(),
          SizedBox(
            width: 5,
          )
        ],
      ),
      body: Card(
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AppTextField(
                  labelText: 'name',
                  readOnly: true,
                  controller: TextEditingController(text: response.name),
                  // textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextField(
                  labelText: 'address',
                  readOnly: true,
                  controller: TextEditingController(text: response.address),
                  // textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextField(
                  labelText: 'city',
                  readOnly: true,
                  controller: TextEditingController(text: response.city),
                  // textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextField(
                  labelText: 'country',
                  readOnly: true,
                  controller: TextEditingController(text: response.country),
                  // textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextField(
                  labelText: 'zipCode',
                  readOnly: true,
                  controller: TextEditingController(text: response.zipCode),
                  // textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextField(
                  labelText: 'phone',
                  readOnly: true,
                  controller: TextEditingController(text: lastFourNumbersPhone),
                  // textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextField(
                  labelText: 'balance',
                  readOnly: true,
                  controller:
                      TextEditingController(text: response.balance.toString()),
                  // textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextField(
                  labelText: 'currency',
                  readOnly: true,
                  controller:
                      TextEditingController(text: response.currency.toString()),
                  // textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextField(
                  labelText: 'currentTradesCount',
                  readOnly: true,
                  controller: TextEditingController(
                      text: response.currentTradesCount.toString()),
                  // textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextField(
                  labelText: 'currentTradesVolume',
                  readOnly: true,
                  controller: TextEditingController(
                      text: response.currentTradesVolume.toString()),
                  // textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextField(
                  labelText: 'equity',
                  readOnly: true,
                  controller:
                      TextEditingController(text: response.equity.toString()),
                  // textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextField(
                  labelText: 'freeMargin',
                  readOnly: true,
                  controller: TextEditingController(
                      text: response.freeMargin.toString()),
                  // textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context).translate('isAnyOpenTrades'),
                    ),
                    const Spacer(),
                    Checkbox(value: response.isAnyOpenTrades, onChanged: null),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context).translate('isSwapFree'),
                    ),
                    const Spacer(),
                    Checkbox(value: response.isSwapFree, onChanged: null),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextField(
                  labelText: 'leverage',
                  readOnly: true,
                  controller:
                      TextEditingController(text: response.leverage.toString()),
                  // textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextField(
                  labelText: 'totalTradesCount',
                  readOnly: true,
                  controller: TextEditingController(
                      text: response.totalTradesCount.toString()),
                  // textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextField(
                  labelText: 'totalTradesVolume',
                  readOnly: true,
                  controller: TextEditingController(
                      text: response.totalTradesVolume.toString()),
                  // textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextField(
                  labelText: 'type',
                  readOnly: true,
                  controller:
                      TextEditingController(text: response.type.toString()),
                  // textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextField(
                  labelText: 'verificationLevel',
                  readOnly: true,
                  controller: TextEditingController(
                      text: response.verificationLevel.toString()),
                  // textInputAction: TextInputAction.next,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
