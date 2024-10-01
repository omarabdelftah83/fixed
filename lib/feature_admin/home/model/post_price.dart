
class RequestPrice {
  final String price;

  RequestPrice({
    required this.price,}
);

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {};
    if (price.isNotEmpty) {
      data['price'] = price;
    }
    return data;
  }

  }
class ResponsePrice {
  final int order;
  final int provider;
  final String price;
  final String? comment;
  final DateTime createdAt;

  ResponsePrice({
    required this.order,
    required this.provider,
    required this.price,
    this.comment,
    required this.createdAt,
  });

  // Factory method to create an instance from a Map (JSON response)
  factory ResponsePrice.fromMap(Map<String, dynamic> map) {
    return ResponsePrice(
      order: map['order'],
      provider: map['provider'],
      price: map['price'],
      comment: map['comment'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }
}
