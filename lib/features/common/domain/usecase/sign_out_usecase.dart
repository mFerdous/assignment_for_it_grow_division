import 'package:flutter/material.dart';

import '../repository/auth_repository.dart';

class SignOutUsecasee {
  final AuthRepository repository;

  SignOutUsecasee({
    required this.repository,
  });

  Future<String> call() async {
    final codeMessage = await repository.signOut();
    debugPrint('Sign Out Usecase: $codeMessage');

    return codeMessage;
  }
}
