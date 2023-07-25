import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/features/profile_info/presentation/cubit/last_four_numbers_phone_cubit.dart';

import '../../../common/presentation/widget/app_text_field.dart';

class LastFourNumbersPhoneScreen extends StatefulWidget {
  const LastFourNumbersPhoneScreen({super.key});

  @override
  State<LastFourNumbersPhoneScreen> createState() =>
      _LastFourNumbersPhoneScreenState();
}

class _LastFourNumbersPhoneScreenState
    extends State<LastFourNumbersPhoneScreen> {
        String? lastFourNumbersPhone;
  @override
  void initState() {
    super.initState();
    getNumber();
  }

  getNumber() async {
    await BlocProvider.of<LastFourNumbersPhoneApiCubit>(context)
        .lastFourNumbersPhone();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LastFourNumbersPhoneApiCubit, LastFourNumbersPhoneApiState>(
      builder: (context, state) {
        if(state is LastFourNumbersPhoneSucceed){
          lastFourNumbersPhone = state.model;
        }
        return AppTextField(
          labelText: 'phone',
          readOnly: true,
          controller:
              TextEditingController(text: lastFourNumbersPhone),
          // textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
