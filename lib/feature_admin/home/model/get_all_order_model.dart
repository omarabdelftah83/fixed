class GetOrderModel {
  final int id;
  final String serviceName;
  final String name;
  final String typeService;
  final String time;
  final String location;
  final String file;
  final String description;
  final int count;
  final int service;
  final int user;

  GetOrderModel({
    required this.id,
    required this.serviceName,
    required this.name,
    required this.typeService,
    required this.time,
    required this.location,
    required this.file,
    required this.description,
    required this.count,
    required this.service,
    required this.user,
  });

  factory GetOrderModel.fromJson(Map<String, dynamic> json) {
    return GetOrderModel(
      id: json['id'],
      serviceName: json['service_name'],
      name: json['name'],
      typeService: json['type_service'],
      time: json['time'],
      location: json['location'],
      file: json['file'],
      description: json['descrtion'],
      count: json['count'],
      service: json['service'],
      user: json['user'],
    );
  }}