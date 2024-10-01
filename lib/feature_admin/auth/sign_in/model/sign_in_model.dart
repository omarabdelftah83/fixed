class SignInRequest {
  String email;
  String password;

  SignInRequest(this.email, this.password);

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class SignInResponse {
  final String? accessToken;
  final String? refreshToken;
  final int? userId;
  final String? username;
  final String? email;
  final bool? provider;
  final bool? requestUser;

  SignInResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.userId,
    required this.username,
    required this.email,
    required this.provider,
    required this.requestUser,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      accessToken: json['access'],
      refreshToken: json['refresh'],
      userId: json['user_id'],
      username: json['username'],
      email: json['email'],
      provider: json['provider'],
      requestUser: json['request_user'],
    );
  }
}
