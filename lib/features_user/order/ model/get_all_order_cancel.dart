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

  // Factory method to create an instance from JSON
  factory GetAllOrderCancelUser.fromJson(Map<String, dynamic> json) {
    return GetAllOrderCancelUser(
      id: json['id'],
      providerName: json['provider_name'],
      providerPic: json['provider_pic'],
      timeArrive: json['time_arrive'],
      price: json['price'],
      comment: json['comment'],
      createdAt: DateTime.parse(json['created_at']),
      status: json['status'],
      order: json['order'],
      provider: json['provider'],
      serviceName: json['service_name'],
      email: json['email'],
      phone: json['phone'],
      idProvider: json['id_provider'],
    );
  }

}
