class GetAllOrderAcceptUser {
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

  GetAllOrderAcceptUser({
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

  factory GetAllOrderAcceptUser.fromJson(Map<String, dynamic> json) {
    return GetAllOrderAcceptUser(
      id: json['id'],
      providerName: json['provider_name'] ?? '',  // Provide a default empty string if null
      providerPic: json['provider_pic'] ?? '',    // Handle null for providerPic
      timeArrive: json['time_arrive'] ?? '',      // Handle null for timeArrive
      price: json['price'] ?? '0.00',             // Handle null for price
      comment: json['comment'] ?? '',             // Handle null for comment
      createdAt: DateTime.parse(json['created_at']),
      status: json['status'] ?? 'N/A',            // Provide a default value for status
      order: json['order'],
      provider: json['provider'],
      serviceName: json['service_name'] ?? '',    // Handle null for serviceName
      email: json['email'] ?? '',                 // Handle null for email
      phone: json['phone'] ?? '',                 // Handle null for phone
      idProvider: json['id_provider'],
    );
  }
}
