import 'package:dio/dio.dart';
import 'package:webbing_fixed/features_user/home/model/order_service.dart';
import 'package:webbing_fixed/network/network_handler.dart';

class GetOrderServiceId {
  final NetworkHandler networkHandler = NetworkHandler();

  Future<OrderServiceModel> getServiceId(int id) async {
    try {
      final response = await Dio().get('http://194.164.77.238/order_service/$id/');
      if (response.statusCode == 200) {
        final json = response.data;
        return OrderServiceModel.fromJson(json);
      } else {
        print('فشل في تحميل الطلبات مع كود الحالة: ${response.statusCode}');
        throw Exception('فشل في تحميل الطلبات');
      }
    } catch (e) {
      print('فشل في تحميل الطلبات: $e');
      throw Exception('فشل في تحميل الطلبات: $e');
    }
  }}