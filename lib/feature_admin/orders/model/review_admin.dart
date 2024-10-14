class ReviewAdminRequest {
  final int rating;

  ReviewAdminRequest({required this.rating});
  Map<String, dynamic> toMap() {
    return {
      'rating': rating,
    };
  }
}

class ReviewAdminResponse {
  final int? serviceProvider;  // Make nullable if the response could be null
  final int? user;             // Make nullable if the response could be null
  final int? rating;           // Make nullable if the response could be null
  final String? comment;
  final DateTime createdAt;

  ReviewAdminResponse({
    required this.serviceProvider,
    required this.user,
    required this.rating,
    this.comment,
    required this.createdAt,
  });

  factory ReviewAdminResponse.fromJson(Map<String, dynamic> json) {
    return ReviewAdminResponse(
      serviceProvider: json['service_provider'] as int?,
      user: json['user'] as int?,
      rating: json['rating'] as int?,
      comment: json['comment'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
