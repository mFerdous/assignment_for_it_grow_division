// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'sign_out_state.dart';

class SignOutCubit
    extends Cubit<SignOutState> {
  SignOutCubit() : super(SignOutState.initial());

  Future<void> signOut() async {
    emit(state.copyWith(isLoading: true));

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      emit(state.copyWith(isRemoved: true));
    } catch (e) {
      emit(state.copyWith(isRemoved: false));
    }

    emit(state.copyWith(isLoading: false));
  }
}
