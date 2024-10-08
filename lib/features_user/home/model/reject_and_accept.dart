class RejectAndAcceptRequest {
  final String decision;

  RejectAndAcceptRequest({required this.decision});

  // Method to convert the model to a JSON map
  Map<String, dynamic> toMap() {
    return {
      'decision': decision,
    };
  }
}
class RejectAndAcceptResponse {
  final String message;

  RejectAndAcceptResponse({required this.message});

  // Factory method to create an instance from JSON
  factory RejectAndAcceptResponse.fromJson(Map<String, dynamic> json) {
    return RejectAndAcceptResponse(
      message: json['message'],
    );
  }
}
