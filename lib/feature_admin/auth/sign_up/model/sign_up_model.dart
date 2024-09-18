class SignUpRequest {
   String username;
   String email;
   String password;
   String password2;
   String phone;
   bool providesServices;
   bool requestServices;

  SignUpRequest(
     this.username,
     this.email,
     this.password,
     this.password2,
     this.phone,
     this.providesServices,
     this.requestServices,
);
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'password2': password2,
      'phone': phone,
      'Provides_services': providesServices,
      'request_services': requestServices,
    };
  }
}
class SignUpResponse {
  final String message;
  final int userId;

  SignUpResponse({
    required this.message,
    required this.userId,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      message: json['message'],
      userId: json['user_id'],
    );
  }
}
