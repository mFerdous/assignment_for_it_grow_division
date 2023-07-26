import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/features/common/presentation/widget/language_switch_button.dart';

import '../../../../core/navigation/route_name.dart';
import '../../../../core/resources/color_res.dart';
import '../../../../core/utils/lang/app_localizations.dart';
import '../../../sign_out/presentation/cubit/sign_out_cubit.dart';

class DrawerWidgets extends StatelessWidget {
  const DrawerWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      child: Container(
        decoration: BoxDecoration(
          color: ColorRes.kSecondaryColor,
        ),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigator.pushNamed(
                        //     context, RouteName.en_premium_calculator);
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.read<SignOutCubit>().signOut();
                        Navigator.pushNamed(context, RouteName.kSignInRoute);
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Icon(
                                Icons.logout,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate('common_sign_out'),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      thickness: 1.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.kProfileRoute);
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate('profile_info'),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.kOpenTradeRoute);
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Icon(
                                Icons.list_alt,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate('open_trades'),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteName.kPromoCampaignsRoute);
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Icon(
                                Icons.heat_pump_sharp,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate('promo_campaign'),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Icon(
                              Icons.language,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: LanguageSwitchButton(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
