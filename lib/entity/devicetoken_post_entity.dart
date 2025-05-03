class DeviceTokenPostEntity {
  String deviceName;
  String deviceToken;
  String platform;

  DeviceTokenPostEntity({
    required this.deviceName,
    required this.deviceToken,
    required this.platform,
  });

  Map<String, dynamic> toJson() {
    return {
      'deviceName': deviceName,
      'deviceToken': deviceToken,
      'platform': platform,
    };
  }
}
