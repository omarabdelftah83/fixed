import 'package:webbing_fixed/features_user/home/model/notification_user_delete.dart';
import 'package:webbing_fixed/network/network_handler.dart';

class DeleteNotificationUser {
  final NetworkHandler networkHandler = NetworkHandler();

  Future<NotificationUserDelete> deleteNotificationUser(int id) async {
    try {
      final response = await networkHandler.delete('http://194.164.77.238/notfications_client/delete/$id/');

      if (response.statusCode == 201) {
        final responseData = NotificationUserDelete.fromJson(response.data);
        return responseData; // إرجاع كائن الرد
      } else {
        print('فشل في حذف الإشعار مع كود الحالة: ${response.statusCode}');
        throw Exception('فشل في حذف الإشعار');
      }
    } catch (e) {
      print('فشل في حذف الإشعار: $e');
      throw Exception('فشل في حذف الإشعار: $e');
    }
  }
}
