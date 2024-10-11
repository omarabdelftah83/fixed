class GetAllOrderCancelUser {
  final int id;
  final String? providerName;
  final String? providerPic;
  final String timeArrive;
  final String price;
  final String comment;
  final DateTime createdAt;
  final String status;
  final int order;
  final int provider;
  final String? serviceName;
  final String? email;
  final String? phone;
  final int idProvider;

  GetAllOrderCancelUser({
    required this.id,
    this.providerName,
    this.providerPic,
    required this.timeArrive,
    required this.price,
    required this.comment,
    required this.createdAt,
    required this.status,
    required this.order,
    required this.provider,
    this.serviceName,
    this.email,
    this.phone,
    required this.idProvider,
  });

  // Updated factory method with null safety
  factory GetAllOrderCancelUser.fromJson(Map<String, dynamic> json) {
    return GetAllOrderCancelUser(
      id: json['id'],
      providerName: json['provider_name'] ?? '',   // Default to empty string if null
      providerPic: json['provider_pic'] ?? '',     // Default to empty string if null
      timeArrive: json['time_arrive'] ?? '',       // Default to empty string if null
      price: json['price'] ?? '0.00',              // Default to '0.00' if null
      comment: json['comment'] ?? '',              // Default to empty string if null
      createdAt: DateTime.parse(json['created_at']),
      status: json['status'] ?? 'Unknown',         // Default to 'Unknown' if null
      order: json['order'],
      provider: json['provider'],
      serviceName: json['service_name'] ?? '',     // Default to empty string if null
      email: json['email'] ?? '',                  // Default to empty string if null
      phone: json['phone'] ?? '',                  // Default to empty string if null
      idProvider: json['id_provider'],
    );
  }
}
