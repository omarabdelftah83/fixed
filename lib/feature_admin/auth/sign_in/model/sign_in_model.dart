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

  SignInResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      accessToken: json['access'],
      refreshToken: json['refresh'],
    );
  }
}
