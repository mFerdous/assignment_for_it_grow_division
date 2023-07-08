// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/profile_info_request.dart';
import '../../domain/usecase/last_four_numbers_phone_usecase.dart';

part 'last_four_numbers_phone_state.dart';

class LastFourNumbersPhoneApiCubit extends Cubit<LastFourNumbersPhoneApiState> {
  final LastFourNumbersPhoneUsecase lastFourNumbersPhoneUsecase;

  LastFourNumbersPhoneApiCubit({
    required this.lastFourNumbersPhoneUsecase,
  }) : super(LastFourNumbersPhoneApiInitial());

  Future<void> lastFourNumbersPhone(ProfileInfoRequest requestModel) async {
    try {
      emit(LastFourNumbersPhoneLoading());

      final responseModel = await lastFourNumbersPhoneUsecase(requestModel);

      emit(LastFourNumbersPhoneSucceed(model: responseModel));
    } catch (ex, strackTrace) {
      emit(LastFourNumbersPhoneFailed(ex, strackTrace));
    }
  }
}
