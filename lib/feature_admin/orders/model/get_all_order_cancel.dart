class GetAllOrderCancel {
  final int order;
  final String status;
  final OrderDetails orderDetails;

  GetAllOrderCancel({
    required this.order,
    required this.status,
    required this.orderDetails,
  });

  factory GetAllOrderCancel.fromJson(Map<String, dynamic> json) {
    return GetAllOrderCancel(
      order: json['order'],
      status: json['status'],
      orderDetails: OrderDetails.fromJson(json['order_details']),
    );
  }

}

class OrderDetails {
  final String service;
  final String user;
  final String typeService;
  final String time;
  final String location;
  final String file;
  final int count;

  OrderDetails({
    required this.service,
    required this.user,
    required this.typeService,
    required this.time,
    required this.location,
    required this.file,
    required this.count,
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
