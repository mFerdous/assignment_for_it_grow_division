import 'package:http/http.dart';

import '../exceptions/exceptions.dart';
import '../resources/error_msg_res.dart';

abstract class ResponseHandler {
  void handle(Response httpResponse);
}

class ResponseHandlerImpl implements ResponseHandler {
  @override
  void handle(Response response) {
    if (response.statusCode != 200) {
      throw ServerException(
        message: ErrorMsgRes.kServerError,
        statusCode: response.statusCode,
      );
    }
  }
}
