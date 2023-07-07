class ErrorMsgRes {
  ErrorMsgRes._init();

  static const kNoInternet = 'Please check your network connectivity';


  static const kUserIdRequired = 'sign-in_idreq';
  static const kPasswordRequired = 'sign-in_passreq';

  static const kNewPasswordRequired = 'set-password_setpass';
  static const kConfirmPasswordRequired = 'set-password_confirmpass';
  static const kPasswordShouldChar =
      'Password should at lease one special character';
  static const kPassword8Char = 'set-password_passmin';
  static const kPasswordNotMatch = 'set-password_passmatch';

  static const kEmaiIdRequired = 'sign-up_emailreq';
  static const kMobileNoRequired = 'sign-up_mobreq';
  static const kInvalidMobileNo = 'sign-up_mobvalid';
  static const kInvalidEmialId = 'sign-up_emailvalid';

  static const kOtpRequired = 'otp_required';
  static const kOtpInvalid = 'otp_invalid';

  static const kNoMessageFound = 'No message found from server';
  static const kServerError = 'common_server_error';
}
