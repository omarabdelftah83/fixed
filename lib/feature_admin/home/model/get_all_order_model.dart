class GetOrderModel {
  final int? id;
  final String? serviceName;
  final String? name;
  final String? typeService;
  final String? time;
  final String? location;
  final String? file;
  final String? description;
  final int? count;
  final int? service;
  final int? user;

  GetOrderModel({
     this.id,
     this.serviceName,
     this.name,
     this.typeService,
     this.time,
     this.location,
     this.file,
     this.description,
     this.count,
     this.service,
     this.user,
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