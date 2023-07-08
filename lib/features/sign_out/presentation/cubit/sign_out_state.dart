part of 'sign_out_cubit.dart';

class SignOutState {
  final bool isLoading;
  final bool isRemoved;

  SignOutState({
    required this.isLoading,
    required this.isRemoved,
  });

  factory SignOutState.initial() {
    return SignOutState(
      isLoading: false,
      isRemoved: false,
    );
  }

  SignOutState copyWith({
    bool? isLoading,
    bool? isRemoved,
  }) {
    return SignOutState(
      isLoading: isLoading ?? this.isLoading,
      isRemoved: isRemoved ?? this.isRemoved,
    );
  }
}
