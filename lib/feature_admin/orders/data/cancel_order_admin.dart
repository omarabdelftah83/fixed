import 'package:webbing_fixed/features_user/order/%20model/cancel_order.dart';
import 'package:webbing_fixed/network/network_handler.dart';

class CancelOrderAdmin {
  final NetworkHandler networkHandler = NetworkHandler();

  Future<CancelOfferResponse> cancelOrderAdmin( int id) async {
    try {
      print('Creating order with ID: $id');
      final response = await networkHandler.postWithoutBody('http://194.164.77.238/cancel_offer_provider/${id}/');
      if (response.statusCode == 200) {
        final json = response.data;
        return CancelOfferResponse.fromJson(json);
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
