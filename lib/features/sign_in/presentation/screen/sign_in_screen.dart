import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/navigation/route_name.dart';
import '../../../../core/resources/export_resources.dart';
import '../../../../core/utils/lang/size_config.dart';
import '../../../common/presentation/widget/app_button.dart';
import '../../../common/presentation/widget/app_dialog.dart';
import '../../../common/presentation/widget/app_large_text.dart';
import '../../../common/presentation/widget/app_loading.dart';
import '../../../common/presentation/widget/container_image_bg_wrapper.dart';
import '../../../common/presentation/widget/language_switch_button.dart';
import '../cubit/sign_in_cubit.dart';
import '../cubit/sign_in_validation/sign_in_validation_cubit.dart';
import '../widget/sign_in_password_field.dart';
import '../widget/sign_in_user_id_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<SignInApiCubit, SignInApiState>(
              listener: (context, state) {
            if (state is SignInLoading) {
              showAppLoading(context);
            } else if (state is SignInFailed) {
              Navigator.pop(context);

              final ex = state.exception;
              if (ex is ServerException) {
                showAppDialog(context, title: ex.message ?? '');
              } else if (ex is NoInternetException) {
                showAppDialog(context, title: ErrorMsgRes.kNoInternet);
              }
            } else if (state is SignInSucceed) {
              Navigator.pop(context);
              final responseModel = state.model;

              if (responseModel.result == true) {
                Navigator.pushNamed(context, RouteName.kDashboardRoute);
              }
            }
          })
        ],
        child: _buildBody(context),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return ContainerImageBgWrapper(
      height: SizeConfig.screenHeight,
      //  -
      //     (kToolbarHeight + SizeConfig.screenPadding.top),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              _buildLanguageChangeButton(),
            ],
          ),
          const Spacer(),
          Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                const AppLargeText(text: 'common_sign_in'),
                const SizedBox(height: 15),

                const SignInUserIdFeild(),
                const SizedBox(height: 15),

                // password
                const SignInPasswordField(),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Spacer(),
                    _buildSignInButton(),
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  _buildLanguageChangeButton() {
    return const LanguageSwitchButton();
  }

  _buildSignInButton() {
    return BlocBuilder<SignInValidationCubit, SignInValidationState>(
      builder: (context, state) {
        return AppButton(
          title: 'common_sign_in',
          isDisabled: state.status.isInvalid || state.status.isPure,
          onTap: () async {
            FocusManager.instance.primaryFocus?.unfocus();

            await context
                .read<SignInApiCubit>()
                .signIn(state.getRequestModel());
          },
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
        );
      },
    );
  }
}
