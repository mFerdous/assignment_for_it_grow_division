import 'dart:convert';

import 'package:http/http.dart';

import '../../../../../core/constant/api_constants.dart';
import '../../../../../core/response_handler/response_handler.dart';

abstract class AuthRemote {
  static const kSignOutEndpath = '/security/signout';

  Future<String> signOut();
}

class AuthRemoteImpl implements AuthRemote {
  final Client client;
  final ResponseHandler handler;

  AuthRemoteImpl({
    required this.client,
    required this.handler,
  });

  @override
  Future<String> signOut() async {
    final response = await client.get(uri);

    handler.handle(response);

    final map = jsonDecode(response.body);
    final messageCode = map['message'];

    return messageCode;
  }

  Uri get uri =>
      Uri.parse('${ApiConstants.baseUrl}${AuthRemote.kSignOutEndpath}');
  // Uri get uri =>
  //     Uri.parse('https://run.mocky.io/v3/34eccf95-2da1-43ee-9c7d-a7484e4c042a');
}
