class CreateNewPassRequest {
  final String email;
  final String password;
  final String password2;

  CreateNewPassRequest(this.email, this.password, this.password2);

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'password2': password2,
    };
  }
}
class CreateNewPassResponse {
  final String success;

  CreateNewPassResponse({
    required this.success,
  });

  factory CreateNewPassResponse.fromJson(Map<String, dynamic> json) {
    return CreateNewPassResponse(
      success: json['success'] ,
    );
  }
}
