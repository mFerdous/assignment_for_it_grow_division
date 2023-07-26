// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:test_task/features/common/presentation/cubit/auth/auth_cubit.dart';
import 'package:test_task/features/profile_info/presentation/screen/phone_number_screen.dart';

import '../../../../core/navigation/route_name.dart';
import '../../../../core/resources/color_res.dart';
import '../../../../core/utils/lang/app_localizations.dart';
import '../../../common/presentation/widget/app_loading.dart';
import '../../../common/presentation/widget/app_text_field.dart';
import '../../../common/presentation/widget/drawer.dart';
import '../../../sign_out/presentation/cubit/sign_out_cubit.dart';
import '../cubit/profile_info_cubit.dart';

class ProfileInfoScreen extends StatefulWidget {
  const ProfileInfoScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  @override
  void initState() {
    super.initState();
    getProfile();
  }

  getProfile() async {
    await BlocProvider.of<ProfileInfoApiCubit>(context).profileInfo();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileInfoApiCubit, ProfileInfoApiState>(
      builder: (context, state) {
        if (state is ProfileInfoLoading) {
          return Center(
            child: LoadingAnimationWidget.discreteCircle(
              color: Colors.white.withOpacity(0.25),
              size: 50,
            ),
          );
        } else if (state is ProfileInfoSucceed) {
          final profileInfoResponse = state.model;
          return Scaffold(
              drawer: DrawerWidgets(),
              appBar: AppBar(
                title: Text(
                  AppLocalizations.of(context).translate('profile_info'),
                ),
                centerTitle: true,
                backgroundColor: ColorRes.kSecondaryColor,
              ),
              body: BlocListener<SignOutCubit, SignOutState>(
                listener: (context, state) {
                  if (state is SignOutLoading) {
                    showAppLoading(context);
                  }
                  if (state is SignOutSuccess) {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, RouteName.kSignInRoute);
                  }
                },
                child: Card(
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
                            controller: TextEditingController(
                                text: profileInfoResponse.name ?? ''),
                            // textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AppTextField(
                            labelText: 'address',
                            readOnly: true,
                            controller: TextEditingController(
                                text: profileInfoResponse.address ?? ''),
                            // textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AppTextField(
                            labelText: 'city',
                            readOnly: true,
                            controller: TextEditingController(
                                text: profileInfoResponse.city ?? ''),
                            // textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AppTextField(
                            labelText: 'country',
                            readOnly: true,
                            controller: TextEditingController(
                                text: profileInfoResponse.country ?? ''),
                            // textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AppTextField(
                            labelText: 'zipCode',
                            readOnly: true,
                            controller: TextEditingController(
                                text: profileInfoResponse.zipCode ?? ''),
                            // textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          LastFourNumbersPhoneScreen(),
                          const SizedBox(
                            height: 15,
                          ),
                          AppTextField(
                            labelText: 'balance',
                            readOnly: true,
                            controller: TextEditingController(
                                text: profileInfoResponse.balance.toString()),
                            // textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AppTextField(
                            labelText: 'currency',
                            readOnly: true,
                            controller: TextEditingController(
                                text: profileInfoResponse.currency.toString()),
                            // textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AppTextField(
                            labelText: 'currentTradesCount',
                            readOnly: true,
                            controller: TextEditingController(
                                text: profileInfoResponse.currentTradesCount
                                    .toString()),
                            // textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AppTextField(
                            labelText: 'currentTradesVolume',
                            readOnly: true,
                            controller: TextEditingController(
                                text: profileInfoResponse.currentTradesVolume
                                    .toString()),
                            // textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AppTextField(
                            labelText: 'equity',
                            readOnly: true,
                            controller: TextEditingController(
                                text: profileInfoResponse.equity.toString()),
                            // textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AppTextField(
                            labelText: 'freeMargin',
                            readOnly: true,
                            controller: TextEditingController(
                                text:
                                    profileInfoResponse.freeMargin.toString()),
                            // textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)
                                    .translate('isAnyOpenTrades'),
                              ),
                              const Spacer(),
                              Checkbox(
                                  value: profileInfoResponse.isAnyOpenTrades,
                                  onChanged: null),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)
                                    .translate('isSwapFree'),
                              ),
                              const Spacer(),
                              Checkbox(
                                  value: profileInfoResponse.isSwapFree,
                                  onChanged: null),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AppTextField(
                            labelText: 'leverage',
                            readOnly: true,
                            controller: TextEditingController(
                                text: profileInfoResponse.leverage.toString()),
                            // textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AppTextField(
                            labelText: 'totalTradesCount',
                            readOnly: true,
                            controller: TextEditingController(
                                text: profileInfoResponse.totalTradesCount
                                    .toString()),
                            // textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AppTextField(
                            labelText: 'totalTradesVolume',
                            readOnly: true,
                            controller: TextEditingController(
                                text: profileInfoResponse.totalTradesVolume
                                    .toString()),
                            // textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AppTextField(
                            labelText: 'type',
                            readOnly: true,
                            controller: TextEditingController(
                                text: profileInfoResponse.type.toString()),
                            // textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AppTextField(
                            labelText: 'verificationLevel',
                            readOnly: true,
                            controller: TextEditingController(
                                text: profileInfoResponse.verificationLevel
                                    .toString()),
                            // textInputAction: TextInputAction.next,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        } else {
          return Text('No data found!');
        }
      },
    );
  }
}



// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:test_task/features/common/presentation/cubit/validation/validation_cubit.dart';

// import '../../../../core/resources/color_res.dart';
// import '../../../../core/utils/lang/app_localizations.dart';
// import '../../../common/presentation/widget/app_text_field.dart';
// import '../../../common/presentation/widget/language_switch_button.dart';
// import '../../../sign_out/presentation/cubit/sign_out_cubit.dart';
// import '../cubit/profile_info_cubit.dart';

// class ProfileInfoScreen extends StatefulWidget {
//   const ProfileInfoScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
// }

// class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<ValidationCubit>().getProfile(context);
//     // context.read<ValidationCubit>().getFourNumbersPhone(context);
//     // getProfile();
//   }

//   // getProfile() {
//   //   context.read<ValidationCubit>().getProfile(context);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           AppLocalizations.of(context).translate('profile_info'),
//         ),
//         centerTitle: true,
//         backgroundColor: ColorRes.kSecondaryColor,
//         actions: [
//           PopupMenuButton(
//             itemBuilder: (BuildContext context) {
//               return [
//                 PopupMenuItem(
//                   child: IconButton(
//                     color: Colors.black,
//                     icon: const Icon(
//                       Icons.logout,
//                     ),
//                     onPressed: () {
//                       context.read<SignOutCubit>().signOut();
//                     },
//                   ),
//                 ),
//                 const PopupMenuItem(
//                   child: LanguageSwitchButton(),
//                 ),
//               ];
//             },
//             child: const CircleAvatar(
//               backgroundColor: ColorRes.kPrimaryColor,
//               child: Icon(Icons.person),
//             ),
//           ),
//           const SizedBox(
//             width: 15,
//           )
//         ],
//       ),
//       body: BlocBuilder<ProfileInfoApiCubit, ProfileInfoApiState>(
//         builder: (context, state) {
//           if(state is ProfileInfoLoading){
//             return Center(
//             child: LoadingAnimationWidget.discreteCircle(
//               color: Colors.white.withOpacity(0.5),
//               size: 50,
//             ),

//             );
//           }
//           else if (state is ProfileInfoSucceed) {
//             final profileInfoResponse = state.model;
//             return Card(
//               elevation: 4.0,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: SingleChildScrollView(
//                   physics: const BouncingScrollPhysics(),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       AppTextField(
//                         labelText: 'name',
//                         readOnly: true,
//                         controller: TextEditingController(
//                             text: profileInfoResponse.name ?? ''),
//                         // textInputAction: TextInputAction.next,
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       AppTextField(
//                         labelText: 'address',
//                         readOnly: true,
//                         controller: TextEditingController(
//                             text: profileInfoResponse.address ?? ''),
//                         // textInputAction: TextInputAction.next,
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       AppTextField(
//                         labelText: 'city',
//                         readOnly: true,
//                         controller: TextEditingController(
//                             text: profileInfoResponse.city ?? ''),
//                         // textInputAction: TextInputAction.next,
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       AppTextField(
//                         labelText: 'country',
//                         readOnly: true,
//                         controller: TextEditingController(
//                             text: profileInfoResponse.country ?? ''),
//                         // textInputAction: TextInputAction.next,
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       AppTextField(
//                         labelText: 'zipCode',
//                         readOnly: true,
//                         controller: TextEditingController(
//                             text: profileInfoResponse.zipCode ?? ''),
//                         // textInputAction: TextInputAction.next,
//                       ),
//                       // const SizedBox(
//                       //   height: 15,
//                       // ),
//                       // AppTextField(
//                       //   labelText: 'phone',
//                       //   readOnly: true,
//                       //   controller: TextEditingController(
//                       //       text: state.lastFourNumbersPhone ?? ''),
//                       //   // textInputAction: TextInputAction.next,
//                       // ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       AppTextField(
//                         labelText: 'balance',
//                         readOnly: true,
//                         controller: TextEditingController(
//                             text: profileInfoResponse.balance.toString()),
//                         // textInputAction: TextInputAction.next,
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       AppTextField(
//                         labelText: 'currency',
//                         readOnly: true,
//                         controller: TextEditingController(
//                             text: profileInfoResponse.currency.toString()),
//                         // textInputAction: TextInputAction.next,
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       AppTextField(
//                         labelText: 'currentTradesCount',
//                         readOnly: true,
//                         controller: TextEditingController(
//                             text: profileInfoResponse.currentTradesCount
//                                 .toString()),
//                         // textInputAction: TextInputAction.next,
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       AppTextField(
//                         labelText: 'currentTradesVolume',
//                         readOnly: true,
//                         controller: TextEditingController(
//                             text: profileInfoResponse.currentTradesVolume
//                                 .toString()),
//                         // textInputAction: TextInputAction.next,
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       AppTextField(
//                         labelText: 'equity',
//                         readOnly: true,
//                         controller: TextEditingController(
//                             text: profileInfoResponse.equity.toString()),
//                         // textInputAction: TextInputAction.next,
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       AppTextField(
//                         labelText: 'freeMargin',
//                         readOnly: true,
//                         controller: TextEditingController(
//                             text: profileInfoResponse.freeMargin.toString()),
//                         // textInputAction: TextInputAction.next,
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             AppLocalizations.of(context)
//                                 .translate('isAnyOpenTrades'),
//                           ),
//                           const Spacer(),
//                           Checkbox(
//                               value: profileInfoResponse.isAnyOpenTrades,
//                               onChanged: null),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             AppLocalizations.of(context)
//                                 .translate('isSwapFree'),
//                           ),
//                           const Spacer(),
//                           Checkbox(
//                               value: profileInfoResponse.isSwapFree,
//                               onChanged: null),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       AppTextField(
//                         labelText: 'leverage',
//                         readOnly: true,
//                         controller: TextEditingController(
//                             text: profileInfoResponse.leverage.toString()),
//                         // textInputAction: TextInputAction.next,
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       AppTextField(
//                         labelText: 'totalTradesCount',
//                         readOnly: true,
//                         controller: TextEditingController(
//                             text: profileInfoResponse.totalTradesCount
//                                 .toString()),
//                         // textInputAction: TextInputAction.next,
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       AppTextField(
//                         labelText: 'totalTradesVolume',
//                         readOnly: true,
//                         controller: TextEditingController(
//                             text: profileInfoResponse.totalTradesVolume
//                                 .toString()),
//                         // textInputAction: TextInputAction.next,
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       AppTextField(
//                         labelText: 'type',
//                         readOnly: true,
//                         controller: TextEditingController(
//                             text: profileInfoResponse.type.toString()),
//                         // textInputAction: TextInputAction.next,
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       AppTextField(
//                         labelText: 'verificationLevel',
//                         readOnly: true,
//                         controller: TextEditingController(
//                             text: profileInfoResponse.verificationLevel
//                                 .toString()),
//                         // textInputAction: TextInputAction.next,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           } else {
//             return Text('No data found!');
//           }
//         },
//       ),
//     );
//   }
// }
