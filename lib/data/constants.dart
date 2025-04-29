class Constants {

  Constants._();
  static final Constants _instance = Constants._();

  factory Constants() => _instance;

  final String baseUrl = "http://api.instapp.zsoltfiddler.hu/api";

  // System
  final String healthCheckUrl = "/healthcheck";

  //Authentication
  final String registerUrl = "/auth/register";
  final String loginUrl = "/auth/login";
  final String logoutUrl = "/auth/logoutUrl";
  final String refreshTokenUrl = "/auth/refresh-token";

  //Devices
  final String fetchDeviceUrl = "/devices";

  //Users
  final String fetchCurrenUserUrl = "/users/profile";
}