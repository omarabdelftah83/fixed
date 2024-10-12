import 'package:dartz/dartz.dart';
import 'package:webbing_fixed/feature_admin/home/model/done_model.dart';
import 'package:webbing_fixed/network/faliar.dart';
import 'package:webbing_fixed/network/network_handler.dart';

class DoneCompeteOrderAdmin {
  final NetworkHandler networkHandler = NetworkHandler();

   Future<Either<Failure, ResponseMessage>> doneOrderAdmin( int id) async {
    try {
      print('Creating order with ID: $id');
      final response = await networkHandler.putWithBody('http://194.164.77.238/compleat/${id}/');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final json = response.data;
        // Return a successful ResponseMessage wrapped in a Right
        return Right(ResponseMessage.fromJson(json));
      } else {
        print('فشل في تحميل الطلبات مع كود الحالة: ${response.statusCode}');
        throw Exception('فشل في تحميل الطلبات');
      }
    } catch (e) {
      print('فشل في تحميل الطلبات: $e');
      throw Exception('فشل في تحميل الطلبات: $e');
    }

  }
}
