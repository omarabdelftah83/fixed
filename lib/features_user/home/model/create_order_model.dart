import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class CreateOrderRequest {
  String? typeService;
  String? time;
  String? location;
  File? image;
  String? description;
  int? count;
  double? lat;  // إضافة خط العرض
  double? lon;  // إضافة خط الطول

  CreateOrderRequest({
    this.typeService,
    this.time,
    this.location,
    this.image,
    this.description,
    this.count,
    this.lat,  // الحقل الجديد
    this.lon,  // الحقل الجديد
  });

  Future<FormData> toMap() async {
    final Map<String, dynamic> map = {};

    if (typeService != null) {
      map['type_service'] = typeService;
    }
    if (time != null) {
      map['time'] = time;
    }
    if (location != null) {
      map['location'] = location;
    }
    if (description != null) {
      map['descrtion'] = description;
    }
    if (count != null) {
      map['count'] = count.toString();
    }
    if (lat != null) {
      map['latitude'] = lat.toString();  // تحويل القيم إلى نص
    }
    if (lon != null) {
      map['longitude'] = lon.toString();  // تحويل القيم إلى نص
    }
    if (image != null) {
      map['file'] = await MultipartFile.fromFile(
        image!.path,
        filename: image!.path.split('/').last,
        contentType: MediaType('file', 'png'),
      );
    }

    final formData = FormData.fromMap(map);
    return formData;
  }
}

class CreateOrderResponse {
  String done;
  CreateOrderResponse({
    required this.done,
  });

  factory CreateOrderResponse.fromJson(Map<String, dynamic> json) {
    return CreateOrderResponse(
      done: json['done'],
    );
  }

}
