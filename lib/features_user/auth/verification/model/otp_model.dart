class OtpRequest {
  final String code;
  final String email;

  OtpRequest(this.code, this.email);

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'email': email
    };
  }
}

class OtpResponse {
  final String message;

  OtpResponse({required this.message});

  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    return OtpResponse(
      message: json['message'],
    );
  }
}
