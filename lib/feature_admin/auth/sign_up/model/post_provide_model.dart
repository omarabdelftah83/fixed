import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';  // Import this for MediaType

class ServicesRequest {
  int? userId;
  int? serviceID;
  File? pic_id;
  File? pic_id2;
  File? personlity_pic;

  ServicesRequest({
    this.userId,
    this.serviceID,
    this.pic_id,
    this.pic_id2,
    this.personlity_pic,
  });

  Future<FormData> toMap() async {
    final Map<String, dynamic> map = {};

    // Add fields
    if (userId != null) {
      map['user'] = userId.toString();
    }
    if (serviceID != null) {
      map['service'] = serviceID.toString();
    }

    // Add files
    if (pic_id != null) {
      map['pic_id'] = await MultipartFile.fromFile(
        pic_id!.path,
        filename: pic_id!.path.split('/').last,
        contentType: MediaType('pic_id', 'png'),
      );
    }
    if (pic_id2 != null) {
      map['pic_id2'] = await MultipartFile.fromFile(
        pic_id2!.path,
        filename: pic_id2!.path.split('/').last,
        contentType: MediaType('pic_id2', 'png'),
      );
    }
    if (personlity_pic != null) {
      map['personlity_pic'] = await MultipartFile.fromFile(
        personlity_pic!.path,
        filename: personlity_pic!.path.split('/').last,
        contentType: MediaType('personlity_pic', 'png'),
      );
    }

    final formData = FormData.fromMap(map);
    return formData;
  }
}

class ServicesResponse {
  final String account;

  ServicesResponse({required this.account});

  factory ServicesResponse.fromJson(Map<String, dynamic> json) {
    return ServicesResponse(
      account: json['account'],
    );
  }
}
