class GetAllOrderComplete {
  final int? id;
  final String? name;
  final String? location;
  final double? price;
  final String? service;
  final DateTime? createdAt; // تغيير إلى DateTime لتسهيل التعامل مع التاريخ
  final String? provider;
  final String? timeArrive;
  final String? comment;
  final String? status;
  final int? order;
  final String? image; // إضافة الحقل image

  GetAllOrderComplete({
    this.id,
    this.name,
    this.location,
    this.price,
    this.service,
    this.createdAt,
    this.provider,
    this.timeArrive,
    this.comment,
    this.status,
    this.order,
    this.image, // إضافة الحقل image إلى المُنشئ
  });

  factory GetAllOrderComplete.fromJson(Map<String, dynamic> json) {
    return GetAllOrderComplete(
      id: json['id'],
      name: json['name'],
      location: json['location'], // يمكن أن تكون null
      price: json['price'],
      service: json['service'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at']) // تحويل السلسلة إلى DateTime
          : null,
      provider: json['provider'],
      timeArrive: json['time_arrive'],
      comment: json['comment'],
      status: json['status'],
      order: json['order'],
      image: json['image'], // إضافة الحقل image من JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'price': price,
      'service': service,
      'created_at': createdAt?.toIso8601String(), // تحويل DateTime إلى سلسلة
      'provider': provider,
      'time_arrive': timeArrive,
      'comment': comment,
      'status': status,
      'order': order,
      'image': image, // إضافة الحقل image إلى JSON
    };
  }
}
