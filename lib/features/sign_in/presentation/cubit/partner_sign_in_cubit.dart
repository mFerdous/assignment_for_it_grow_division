// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/partner_sign_in_request.dart';
import '../../domain/usecase/partner_sign_in_usecase.dart';

part 'partner_sign_in_state.dart';

class PartnerSignInApiCubit extends Cubit<PartnerSignInApiState> {
  final PartnerSignInUsecase partnerSignInUsecase;

  PartnerSignInApiCubit({
    required this.partnerSignInUsecase,
  }) : super(PartnerSignInApiInitial());

  Future<void> partnerSignIn(PartnerSignInRequest requestModel) async {
    try {
      emit(PartnerSignInLoading());

      final responseModel = await partnerSignInUsecase(requestModel);

      emit(PartnerSignInSucceed(model: responseModel));
    } catch (ex, strackTrace) {
      emit(PartnerSignInFailed(ex, strackTrace));
    }
  }
}
