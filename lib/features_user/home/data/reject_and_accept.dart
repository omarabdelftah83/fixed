import 'package:webbing_fixed/features_user/home/model/reject_and_accept.dart';
import 'package:webbing_fixed/network/network_handler.dart';

class RejectAndAcceptService {
  final NetworkHandler networkHandler = NetworkHandler();

  Future<RejectAndAcceptResponse> rejectAndAccept(RejectAndAcceptRequest rejectAndAcceptRequest, int id) async {
    try {
      print('Creating order with ID: $id');
      final formData = await rejectAndAcceptRequest.toMap();
      print('Request data: $formData');
      final response = await networkHandler.post('http://194.164.77.238/offer_decision/${id}/', formData);
      if (response.statusCode == 200) {
        final json = response.data;
        return RejectAndAcceptResponse.fromJson(json);
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
