class ForgetPasswordRequest {
  final String email;

  ForgetPasswordRequest(this.email,);

  Map<String, dynamic> toMap() {
    return {
      'email': email,
    };
  }
}
class ForgetPasswordResponse {
  final String message;

  ForgetPasswordResponse({ required this.message});

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordResponse(
      message: json['message'],
    );
  }}