// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/profile_info_request.dart';
import '../../data/model/profile_info_response.dart';
import '../../domain/usecase/profile_info_usecase.dart';

part 'profile_info_state.dart';

class ProfileInfoApiCubit extends Cubit<ProfileInfoApiState> {
  final ProfileInfoUsecase profileInfoUsecase;

  ProfileInfoApiCubit({
    required this.profileInfoUsecase,
  }) : super(ProfileInfoApiInitial());

  Future<void> profileInfo(ProfileInfoRequest requestModel) async {
    try {
      emit(ProfileInfoLoading());

      final responseModel = await profileInfoUsecase(requestModel);

      emit(ProfileInfoSucceed(model: responseModel));
    } catch (ex, strackTrace) {
      emit(ProfileInfoFailed(ex, strackTrace));
    }
  }
}
