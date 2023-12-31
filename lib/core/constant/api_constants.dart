class ApiConstants {
  ApiConstants._();

  static const baseUrl = 'https://peanut.ifxdb.com/api';
  static const partnerBaseUrl = 'https://client-api.contentdatapro.com/api';
  static const partnerBasePath = 'https://client-api.contentdatapro.com';

  static const signInUrl = '/ClientCabinetBasic/IsAccountCredentialsCorrect';
  static const profileInfoUrl = '/ClientCabinetBasic/GetAccountInformation';
  static const partnerSignInUrl = '/Authentication/RequestMoblieCabinetApiToken';
  static const lastFourNumberPhoneUrl = '/ClientCabinetBasic/GetLastFourNumbersPhone';
  static const analyticSignalsUrl = '/clientmobile/GetAnalyticSignals';
  static const openTradesUrl = '/ClientCabinetBasic/GetOpenTrades';
}
