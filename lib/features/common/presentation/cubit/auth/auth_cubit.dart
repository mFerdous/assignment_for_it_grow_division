import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/sign_out_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignOutUsecasee signOutUsecase;

  AuthCubit({
    required this.signOutUsecase,
  }) : super(AuthInitial());

  Future<void> signOut() async {
    try {
      emit(SignOutLoading());
      final message = await signOutUsecase();
      emit(SignOutSuccess(message: message));
    } catch (ex, stackTrace) {
      emit(SignOutFailed(exception: ex, stackTrace: stackTrace));
    }
  }
}
