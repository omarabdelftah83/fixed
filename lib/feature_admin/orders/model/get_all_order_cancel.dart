
class GetAllOrderCancel {
  final int id;
  final int order;
  final String status;
  final OrderDetails orderDetails;

  GetAllOrderCancel({
    required this.id,
    required this.order,
    required this.status,
    required this.orderDetails,
  });

  factory GetAllOrderCancel.fromJson(Map<String, dynamic> json) {
    return GetAllOrderCancel(
      id: json['id'],
      order: json['order'],
      status: json['status'],
      orderDetails: OrderDetails.fromJson(json['order_details']),
    );
  }


}

class OrderDetails {
  final String service;
  final String user;
  final int idUser;
  final String typeService;
  final String time;
  final String location;
  final String file;
  final int count;
  final int idOrder;

  OrderDetails({
    required this.service,
    required this.user,
    required this.idUser,
    required this.typeService,
    required this.time,
    required this.location,
    required this.file,
    required this.count,
    required this.idOrder,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) {
    return OrderDetails(
      service: json['service'],
      user: json['user'],
      idUser: json['id_user'],
      typeService: json['type_service'],
      time: json['time'],
      location: json['location'],
      file: json['file'],
      count: json['count'],
      idOrder: json['id_order'],
    );
  }
}
