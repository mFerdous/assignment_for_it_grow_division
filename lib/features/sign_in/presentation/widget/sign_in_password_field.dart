import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../core/utils/lang/app_localizations.dart';
import '../../../common/presentation/cubit/validation/validation_cubit.dart';
import '../../../common/presentation/widget/app_passowrd_text_field.dart';

class SignInPasswordField extends StatelessWidget {
  const SignInPasswordField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidationCubit, ValidationState>(
      buildWhen: ((previous, current) => previous.password != current.password),
      builder: (context, state) {
        return AppPasswordTextField(
            labelText:
                AppLocalizations.of(context).translate('common_password'),
            errorText: state.password.status == FormzInputStatus.pure
                ? 'sign-in_passreq'
                : state.password.error?.message,
            onChange: (value) {
              context.read<ValidationCubit>().changePassword(value);
            });
      },
    );
  }
}
