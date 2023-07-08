import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_task/features/profile_info/presentation/screen/profile_info_screen.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/navigation/route_name.dart';
import '../../../../core/resources/export_resources.dart';
import '../../../common/presentation/widget/app_dialog.dart';
import '../../../common/presentation/widget/app_loading.dart';
import '../../../profile_info/presentation/cubit/profile_info_cubit.dart';
import '../../../sign_in/presentation/cubit/sign_in_validation/sign_in_validation_cubit.dart';
import '../../../sign_out/presentation/cubit/sign_out_cubit.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String? userId;
  String? token;
  getSignInResponse() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      userId = sharedPreferences.getString("user_id");
      token = sharedPreferences.getString("access_token");
      context.read<SignInValidationCubit>().changeUserId(userId!);
      context.read<SignInValidationCubit>().changeToken(token!);
    });

    // setState(() {
    //   // accessToken = sharedPreferences.getString("access_token");
    //   accessToken = sharedPreferences.getString("access_token");
    //   partnerToken = sharedPreferences.getString("access_token");
    // });
  }

  @override
  void initState() {
    super.initState();
    getSignInResponse();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInValidationCubit, SignInValidationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorRes.kSecondaryColor,
            title: const Text('Dashboard'),
            actions: [
              // AvatarPopup(),
              PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: TextButton(
                        onPressed: () async {
                          await context
                              .read<ProfileInfoApiCubit>()
                              .profileInfo(state.getProfileInfoRequestModel());
                        },
                        child: const Text('View Profile'),
                      ),
                    ),
                    PopupMenuItem(
                      child: IconButton(
                        color: Colors.black,
                        icon: const Icon(
                          Icons.logout,
                        ),
                        onPressed: () {
                          context.read<SignOutCubit>().signOut();
                        },
                      ),
                    ),
                    // Add more menu options as needed
                  ];
                },
                child: const CircleAvatar(
                  backgroundColor: ColorRes.kPrimaryColor,
                  child: Icon(Icons.person),
                ),
              ),
            ],
          ),
          body: MultiBlocListener(
            listeners: [
              BlocListener<SignOutCubit, SignOutState>(
                listener: (context, state) {
                  log(state.isRemoved.toString());
                  if (state.isRemoved == true) {
                    Navigator.pushNamed(context, RouteName.kSignInRoute);
                  }
                },
              ),
              BlocListener<ProfileInfoApiCubit, ProfileInfoApiState>(
                listener: (context, state) {
                  if (state is ProfileInfoLoading) {
                    showAppLoading(context);
                  } else if (state is ProfileInfoFailed) {
                    Navigator.pop(context);

                    final ex = state.exception;
                    if (ex is ServerException) {
                      showAppDialog(context, title: ex.message ?? '');
                    } else if (ex is NoInternetException) {
                      showAppDialog(context, title: ErrorMsgRes.kNoInternet);
                    }
                  } else if (state is ProfileInfoSucceed) {
                    Navigator.pop(context);
                    final responseModel = state.model;

                    if (responseModel.name!.isNotEmpty) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProfileInfoScreen(response: responseModel)));
                    }
                  }
                },
              ),
            ],
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(userId??''),
                  Text(token??''),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
