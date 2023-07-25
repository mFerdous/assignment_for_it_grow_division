// // ignore_for_file: public_member_api_docs, sort_constructors_first
// // ignore_for_file: use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:formz/formz.dart';
// import 'package:test_task/features/profile_info/presentation/screen/profile_info_screen.dart';

// import '../../../../core/exceptions/exceptions.dart';
// import '../../../../core/navigation/route_name.dart';
// import '../../../../core/resources/export_resources.dart';
// import '../../../../core/utils/lang/app_localizations.dart';
// import '../../../../core/utils/lang/size_config.dart';
// import '../../../common/presentation/cubit/validation/validation_cubit.dart';
// import '../../../common/presentation/widget/app_bottom_sheet.dart';
// import '../../../common/presentation/widget/app_dialog.dart';
// import '../../../common/presentation/widget/app_loading.dart';
// import '../../../common/presentation/widget/app_text_field_dropdown.dart';
// import '../../../common/presentation/widget/container_image_bg_wrapper.dart';
// import '../../../common/presentation/widget/language_switch_button.dart';
// import '../../../profile_info/data/model/profile_info_response.dart';
// import '../../../profile_info/presentation/cubit/last_four_numbers_phone_cubit.dart';
// import '../../../profile_info/presentation/cubit/profile_info_cubit.dart';
// import '../../../sign_out/presentation/cubit/sign_out_cubit.dart';
// import '../../data/model/analytic_signals_response.dart';
// import '../cubit/analytic_signals_cubit.dart';

// class Dashboard extends StatefulWidget {
//   List<dynamic>? analyticSignalsResponse;
//   Dashboard({
//     Key? key,
//     this.analyticSignalsResponse,
//   }) : super(key: key);

//   @override
//   State<Dashboard> createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   String? fromDate = DateTime.now().toString().split(' ')[0];
//   String? toDate = DateTime.now().toString().split(' ')[0];
//   late ProfileInfoResponse profileInfoResponse;

//   late List<AnalyticSignalsResponse> analyticList;

//   var valState;

//   @override
//   void initState() {
//     super.initState();

//     analyticList =
//         widget.analyticSignalsResponse!.cast<AnalyticSignalsResponse>();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // return BlocBuilder<ValidationCubit, ValidationState>(
//     //   builder: (context, valState) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: ColorRes.kSecondaryColor,
//         title: Text(
//           AppLocalizations.of(context).translate('common_home'),
//         ),
//         centerTitle: true,
//         actions: [
//           PopupMenuButton(
//             itemBuilder: (BuildContext context) {
//               return [
//                 PopupMenuItem(
//                   child: BlocBuilder<ValidationCubit, ValidationState>(
//                     builder: (context, state) {
//                       valState = state;
//                       return TextButton(
//                         onPressed: () async {
//                           Navigator.pop(context);
//                           await context
//                               .read<ProfileInfoApiCubit>()
//                               .profileInfo(state.getProfileInfoRequestModel());
//                         },
//                         child: const Text('View Profile'),
//                       );
//                     },
//                   ),
//                 ),
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
//       body: MultiBlocListener(
//         listeners: [
//           BlocListener<SignOutCubit, SignOutState>(
//             listener: (context, state) {
//               if (state.isRemoved == true) {
//                 Navigator.pushNamed(context, RouteName.kSignInRoute);
//               }
//             },
//           ),
//           BlocListener<ProfileInfoApiCubit, ProfileInfoApiState>(
//             listener: (context, state) async {
//               if (state is ProfileInfoLoading) {
//                 showAppLoading(context);
//               } else if (state is ProfileInfoFailed) {
//                 Navigator.pop(context);

//                 final ex = state.exception;
//                 if (ex is ServerException) {
//                   showAppDialog(context, title: ex.message ?? '');
//                 } else if (ex is NoInternetException) {
//                   showAppDialog(context, title: ErrorMsgRes.kNoInternet);
//                 }
//               } else if (state is ProfileInfoSucceed) {
//                 Navigator.pop(context);
//                 final responseModel = state.model;

//                 if (responseModel.name!.isNotEmpty) {
//                   profileInfoResponse = responseModel;

//                   await context
//                       .read<LastFourNumbersPhoneApiCubit>()
//                       .lastFourNumbersPhone(
//                           valState.getProfileInfoRequestModel());
//                 }
//               }
//             },
//           ),
//           BlocListener<LastFourNumbersPhoneApiCubit,
//               LastFourNumbersPhoneApiState>(
//             listener: (context, state) async {
//               if (state is LastFourNumbersPhoneLoading) {
//                 showAppLoading(context);
//               } else if (state is LastFourNumbersPhoneFailed) {
//                 Navigator.pop(context);

//                 final ex = state.exception;
//                 if (ex is ServerException) {
//                   showAppDialog(context, title: ex.message ?? '');
//                 } else if (ex is NoInternetException) {
//                   showAppDialog(context, title: ErrorMsgRes.kNoInternet);
//                 }
//               } else if (state is LastFourNumbersPhoneSucceed) {
//                 Navigator.pop(context);
//                 final responseModel = state.model;

//                 if (responseModel.isNotEmpty) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ProfileInfoScreen(),
//                     ),
//                   );
//                 }
//               }
//             },
//           ),
//         ],
//         child: ContainerImageBgWrapper(
//           height: SizeConfig.screenHeight,
//           //  -
//           //     (kToolbarHeight + SizeConfig.screenPadding.top),
//           width: double.infinity,
//           child: Column(
//             children: [
//               BlocBuilder<ValidationCubit, ValidationState>(
//                 builder: (context, state) {
//                   return Card(
//                     elevation: 4,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           _buildCurrencyPairsDropdown(),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           _buildFromDate(state),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           _buildToDate(state),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               BlocBuilder<AnalyticSignalsApiCubit, AnalyticSignalsApiState>(
//                 builder: (context, state) {
//                   if (state is AnalyticSignalsSucceed) {
//                     analyticList = state.model.cast<AnalyticSignalsResponse>();
//                     return Card(
//                       child: Container(
//                         height: MediaQuery.of(context).size.height * .5,
//                         child: ListView.builder(
//                             itemCount: analyticList.length,
//                             itemBuilder: (BuildContext context, int index) {
//                               return ListTile(
//                                 title: Card(
//                                     elevation: 4,
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Column(
//                                         children: [
//                                           Row(
//                                             children: [
//                                               const Text('ID: '),
//                                               Text(analyticList[index]
//                                                   .id
//                                                   .toString()),
//                                             ],
//                                           ),
//                                           const SizedBox(
//                                             height: 5,
//                                           ),
//                                           Row(
//                                             children: [
//                                               const Text('Actual Time: '),
//                                               Text(
//                                                   '${DateTime.fromMillisecondsSinceEpoch(analyticList[index].actualTime! * 1000)}'
//                                                       .split('.')[0]),
//                                             ],
//                                           ),
//                                           const SizedBox(
//                                             height: 5,
//                                           ),
//                                           Row(
//                                             children: [
//                                               const Text('Comment: '),
//                                               Text(analyticList[index]
//                                                   .comment
//                                                   .toString()),
//                                             ],
//                                           ),
//                                           const SizedBox(
//                                             height: 5,
//                                           ),
//                                           Row(
//                                             children: [
//                                               const Text('Pair: '),
//                                               Text(analyticList[index]
//                                                   .pair
//                                                   .toString()),
//                                             ],
//                                           ),
//                                           const SizedBox(
//                                             height: 5,
//                                           ),
//                                           Row(
//                                             children: [
//                                               const Text('Cmd: '),
//                                               Text(analyticList[index]
//                                                   .cmd
//                                                   .toString()),
//                                             ],
//                                           ),
//                                           const SizedBox(
//                                             height: 5,
//                                           ),
//                                           Row(
//                                             children: [
//                                               const Text('Trading System: '),
//                                               Text(analyticList[index]
//                                                   .tradingSystem
//                                                   .toString()),
//                                             ],
//                                           ),
//                                           const SizedBox(
//                                             height: 5,
//                                           ),
//                                           Row(
//                                             children: [
//                                               const Text('Period: '),
//                                               Text(analyticList[index]
//                                                   .period
//                                                   .toString()),
//                                             ],
//                                           ),
//                                           const SizedBox(
//                                             height: 5,
//                                           ),
//                                           Row(
//                                             children: [
//                                               const Text('Price: '),
//                                               Text(analyticList[index]
//                                                   .price
//                                                   .toString()),
//                                             ],
//                                           ),
//                                           const SizedBox(
//                                             height: 5,
//                                           ),
//                                           Row(
//                                             children: [
//                                               const Text('Sl: '),
//                                               Text(analyticList[index]
//                                                   .sl
//                                                   .toString()),
//                                             ],
//                                           ),
//                                           const SizedBox(
//                                             height: 5,
//                                           ),
//                                           Row(
//                                             children: [
//                                               const Text('Tp: '),
//                                               Text(analyticList[index]
//                                                   .tp
//                                                   .toString()),
//                                             ],
//                                           ),
//                                           const SizedBox(
//                                             height: 5,
//                                           ),
//                                         ],
//                                       ),
//                                     )),
//                               );
//                             }),
//                       ),
//                     );
//                   } else {
//                     return const Center(child: Text(" Went Wrong"));
//                   }
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );

//     //   },
//     // );
//   }

//   Widget _buildCurrencyPairsDropdown() {
//     return BlocBuilder<ValidationCubit, ValidationState>(
//       builder: (context, state) {
//         final formz = state.currencyPairs;

//         List<String> listOfCurrencyPairs = [
//           'EURUSD',
//           'GBPUSD',
//           'USDJPY',
//           'USDCHF',
//           'USDCAD',
//           'AUDUSD',
//           'NZDUSD'
//         ];
//         return AppTextFieldDropdown(
//           labelText: 'currency_pairs',
//           errorText: formz.status == FormzInputStatus.pure ? null : formz.error,
//           value: formz.value,
//           onTap: () {
//             showAppModalBottomSheet(
//               context: context,
//               title: 'Select Currency Pair',
//               items: listOfCurrencyPairs,
//               onItemSelected:
//                   context.read<ValidationCubit>().changeCurrencyPairs,
//               onItemSelected2: getAnalyticSignal
//             );

//           },
//         );
//       },
//     );
//   }

//   Widget _buildFromDate(state) {
//     return BlocBuilder<ValidationCubit, ValidationState>(
//         builder: (context, state) {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           const Text("From Date: "),
//           const Spacer(),
//           Text(fromDate!),
//           const SizedBox(
//             width: 10.0,
//           ),
//           IconButton(
//             onPressed: () => _selectFromDate(context, state),
//             icon: const Icon(Icons.calendar_month),
//           )
//         ],
//       );
//     });
//   }

//   Future<void> _selectFromDate(BuildContext context, state) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1960, 8),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null) {
//       fromDate = picked.toString().split(' ')[0];
//       context.read<ValidationCubit>().changeFromDate(fromDate!);

//       DateTime dateTime = DateTime.parse('$picked');
//       int timestamp = dateTime.millisecondsSinceEpoch ~/ 1000;

//       context.read<ValidationCubit>().changeFrom(timestamp.toString());

//       await BlocProvider.of<AnalyticSignalsApiCubit>(context)
//           .analyticSignals(state.getAnalyticSignals());
//     }
//   }

//   Widget _buildToDate(state) {
//     return BlocBuilder<ValidationCubit, ValidationState>(
//         builder: (context, state) {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           const Text("To Date: "),
//           const Spacer(),
//           Text(toDate!),
//           const SizedBox(
//             width: 10.0,
//           ),
//           IconButton(
//             onPressed: () => _selectToDate(context, state),
//             icon: const Icon(Icons.calendar_month),
//           )
//         ],
//       );
//     });
//   }

//   Future<void> _selectToDate(BuildContext context, state) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1960, 8),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null) {
//       toDate = picked.toString().split(' ')[0];
//       context.read<ValidationCubit>().changeToDate(toDate!);

//       DateTime dateTime = DateTime.parse('$picked');
//       int timestamp = dateTime.millisecondsSinceEpoch ~/ 1000;

//       context.read<ValidationCubit>().changeTo(timestamp.toString());
//       await BlocProvider.of<AnalyticSignalsApiCubit>(context)
//           .analyticSignals(state.getAnalyticSignals());
//     }
//   }

//   getCurrencyPair(value) {
//     context.read<ValidationCubit>().changeCurrencyPairs(value);
//   }

//   getAnalyticSignal(val) async {
//     context.read<ValidationCubit>().fetchAnalyticSignals(context);

//     // await BlocProvider.of<AnalyticSignalsApiCubit>(context)
//     //     .analyticSignals(state.getAnalyticSignals());
//   }
// }
