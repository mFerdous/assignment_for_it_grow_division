import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../core/utils/lang/app_localizations.dart';
import '../../../common/presentation/cubit/validation/validation_cubit.dart';
import '../../../common/presentation/widget/app_text_field.dart';

class SignInUserIdFeild extends StatelessWidget {
  const SignInUserIdFeild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidationCubit, ValidationState>(
        builder: (context, state) {
          return AppTextField(
            keyboardType: TextInputType.number,
            labelText: AppLocalizations.of(context).translate('common_user_id'),
            errorText: state.userId.status == FormzInputStatus.pure
                ? 'sign-in_idreq'
                : state.userId.error?.message,
            onChange: (value) {
              context.read<ValidationCubit>().changeUserId(value);
            },
          );
        });
  }
}
