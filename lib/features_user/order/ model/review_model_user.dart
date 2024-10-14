class ReviewRequest {
  final int rating;

  ReviewRequest({required this.rating});
  Map<String, dynamic> toMap() {
    return {
      'rating': rating,
    };
  }
}

class ReviewResponse {
  final int? serviceProvider;
  final int? user;
  final int? rating;
  final String? comment;
  final DateTime createdAt;

  ReviewResponse({
    required this.serviceProvider,
    required this.user,
    required this.rating,
    this.comment,
    required this.createdAt,
  });

  factory ReviewResponse.fromJson(Map<String, dynamic> json) {
    return ReviewResponse(
      serviceProvider: json['service_provider'] as int?,
      user: json['user'] as int?,
      rating: json['rating'] as int?,
      comment: json['comment'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
