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
  final int serviceProvider;
  final int user;
  final int rating;
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
      serviceProvider: json['service_provider'],
      user: json['user'],
      rating: json['rating'],
      comment: json['comment'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
