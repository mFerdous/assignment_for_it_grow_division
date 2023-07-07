import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/sign_in_request.dart';
import '../../data/model/sign_in_response.dart';
import '../../domain/usecase/sign_in_usecase.dart';

part 'sign_in_state.dart';

class SignInApiCubit extends Cubit<SignInApiState> {
  final SignInUsecase signInUsecase;

  SignInApiCubit({
    required this.signInUsecase,
  }) : super(SignInApiInitial());

  Future<void> signIn(SignInRequest requestModel) async {
    try {
      emit(SignInLoading());

      final responseModel = await signInUsecase(requestModel);

      emit(SignInSucceed(model: responseModel));
    } catch (ex, strackTrace) {
      emit(SignInFailed(ex, strackTrace));
    }
  }
}
