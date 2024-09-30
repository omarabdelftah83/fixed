class GetAllOrderAccept {
  final int? order;
  final String? status;
  final OrderDetails? orderDetails;

  GetAllOrderAccept({
     this.order,
     this.status,
     this.orderDetails,
  });

  factory GetAllOrderAccept.fromJson(Map<String, dynamic> json) {
    return GetAllOrderAccept(
      order: json['order'],
      status: json['status'],
      orderDetails: OrderDetails.fromJson(json['order_details']),
    );
  }

}

class OrderDetails {
  final String? service;
  final String? user;
  final String? typeService;
  final String? time;
  final String? location;
  final String? file;
  final int? count;

  OrderDetails({
     this.service,
     this.user,
     this.typeService,
     this.time,
     this.location,
     this.file,
     this.count,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) {
    return OrderDetails(
      service: json['service'],
      user: json['user'],
      typeService: json['type_service'],
      time: json['time'],
      location: json['location'],
      file: json['file'],
      count: json['count'],
    );
  }
}