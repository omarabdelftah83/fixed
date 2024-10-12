class UpdatePriceRequest {
  final String price;

  UpdatePriceRequest({required this.price});

  Map<String, dynamic> toMap() {
    return {
      'price': price,
    };
  }
}
class UpdatePriceResponse {
  final int order;
  final int provider;
  final String price;
  final String timeArrive;
  final String createdAt;

  UpdatePriceResponse({
    required this.order,
    required this.provider,
    required this.price,
    required this.timeArrive,
    required this.createdAt,
  });

  factory UpdatePriceResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePriceResponse(
      order: json['order'],
      provider: json['provider'],
      price: json['price'],
      timeArrive: json['time_arrive'] ?? '', // Handle potential null values
      createdAt: json['created_at'],
    );
  }
}
