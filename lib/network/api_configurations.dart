class ApiConfigurations {
  // Base URL
  static const String _baseUrl = "http://194.164.77.238/";

  // Authentication endpoints
  static const String signUp = "${_baseUrl}sing_up/";
  static const String signIn = "${_baseUrl}sing_in";
  static const String resetPassword = "${_baseUrl}resetPassword/";
  static const String otp = "${_baseUrl}checkCode/";
  static const String createPass = "${_baseUrl}change_passviwe/";

  // Service-related endpoints
  static const String getAllServices = "${_baseUrl}all_service/";
  static const String postAllServices = "${_baseUrl}active_provider/";

  // Order-related endpoints
  static const String getOrderHome = "${_baseUrl}order_service/";
  static const String getOrderComplete = "${_baseUrl}Get_compleata_for_provider/";
  static const String getOrderAccept = "${_baseUrl}provider_accept/";
  static const String getOrderCancel = "${_baseUrl}cancel_offer_provider/";

  // User-related endpoints
  static const String getUserData = "${_baseUrl}UserDetailView/";
  static const String updateUserData = "${_baseUrl}userupdate/";

}
