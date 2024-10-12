class GetAllOrderCompleteUser {
  final int id;
  final String name;
  final String? location;
  final double price;
  final String service;
  final DateTime createdAt;
  final String provider;
  final String image;
  final int idProvider;
  final int user;
  final String? timeArrive;
  final String? comment;
  final String status;
  final int order;

  GetAllOrderCompleteUser({
    required this.id,
    required this.name,
    this.location,
    required this.price,
    required this.service,
    required this.createdAt,
    required this.provider,
    required this.image,
    required this.idProvider,
    required this.user,
    this.timeArrive,
    this.comment,
    required this.status,
    required this.order,
  });

  factory GetAllOrderCompleteUser.fromJson(Map<String, dynamic> json) {
    return GetAllOrderCompleteUser(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      price: json['price']?.toDouble(),
      service: json['service'],
      createdAt: DateTime.parse(json['created_at']),
      provider: json['provider'],
      image: json['image'],
      idProvider: json['id_provider'],
      user: json['user'],
      timeArrive: json['time_arrive'] ?? '',
      comment: json['comment'],
      status: json['status'],
      order: json['order'],
    );
  }

}
