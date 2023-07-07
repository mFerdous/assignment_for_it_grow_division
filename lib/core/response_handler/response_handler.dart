import 'dart:convert';

import 'package:http/http.dart';

import '../exceptions/exceptions.dart';
import '../resources/error_msg_res.dart';

abstract class ResponseHandler {
  void handle(Response httpResponse);
}

class ResponseHandlerImpl implements ResponseHandler {
  @override
  void handle(Response response) {
    // debugPrint('response: ${response.body}');
    if (response.statusCode != 200) {
      throw ServerException(
        message: ErrorMsgRes.kServerError,
        statusCode: response.statusCode,
      );
    }
    // final Map<String, dynamic> map = json.decode(response.body);
    // final statusCode = map["code"];
    // if (statusCode != 200) {
    //   throw ServerException(
    //     message: map["message"],
    //     statusCode: statusCode,
    //   );
    // }
  }
}
