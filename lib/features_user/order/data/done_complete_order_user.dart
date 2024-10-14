import 'package:dartz/dartz.dart';
import 'package:webbing_fixed/feature_admin/home/model/done_model.dart';
import 'package:webbing_fixed/network/faliar.dart';
import 'package:webbing_fixed/network/network_handler.dart';

class DoneCompeteOrderUser {
  final NetworkHandler networkHandler = NetworkHandler();

  Future<ResponseMessage> doneOrderUser(int id) async {
    try {
      print('Creating order with ID: $id');
      final response = await networkHandler.putWithBody(
          'http://194.164.77.238/Completa_proceser_client/$id/');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final json = response.data;
        return ResponseMessage.fromJson(json);
      } else {
        print('Failed to load orders with status code: ${response.statusCode}');
        throw Exception('Failed to load orders');
      }
    } catch (e) {
      print('Failed to load orders: $e');
      throw Exception('Failed to load orders: $e');
    }
  }}
