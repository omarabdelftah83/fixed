class UpdateUserRequest {
  final String? username;
  final String? location;
  final String? phone;

  UpdateUserRequest({
    this.username,
    this.location,
    this.phone,
  });

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {};

    if (username != null && username!.isNotEmpty) {
      data['username'] = username;
    }
    if (location != null && location!.isNotEmpty) {
      data['location'] = location;
    }
    if (phone != null && phone!.isNotEmpty) {
      data['phone'] = phone;
    }

    return data;
  }
}

class UpdateUserResponse {
  final String username;
  final String location;
  final String country;
  final String phone;
  final String lan;

  UpdateUserResponse({
    required this.username,
    required this.location,
    required this.country,
    required this.phone,
    required this.lan,
  });

  factory UpdateUserResponse.fromMap(Map<String, dynamic> json) {
    return UpdateUserResponse(
      username: json['username'],
      location: json['location'],
      country: json['country'],
      phone: json['phone'],
      lan: json['lan'],
    );
  }
}
