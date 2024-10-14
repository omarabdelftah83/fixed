class GetAllOrderComplete {
  final int? id;
  final String? name;
  final String? location;
  final double? price;
  final String? service;
  final DateTime? createdAt;
  final String? provider;
  final String? image;
  final int? idProvider;
  final int? user;
  final String? timeArrive;
  final String? comment;
  final String? status;
  final int? order;

  GetAllOrderComplete({
     this.id,
     this.name,
    this.location,
     this.price,
     this.service,
     this.createdAt,
     this.provider,
     this.image,
     this.idProvider,
     this.user,
    this.timeArrive,
    this.comment,
     this.status,
     this.order,
  });

  factory GetAllOrderComplete.fromJson(Map<String, dynamic> json) {
    return GetAllOrderComplete(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      price: json['price'],
      service: json['service'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      provider: json['provider'],
      image: json['image'],
      idProvider: json['id_provider'],
      user: json['user'],
      timeArrive: json['time_arrive'],
      comment: json['comment'],
      status: json['status'],
      order: json['order'],
    );
  }
}
