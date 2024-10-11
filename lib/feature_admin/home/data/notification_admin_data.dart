import 'package:webbing_fixed/feature_admin/home/model/notification_admin.dart';
import 'package:webbing_fixed/features_user/home/model/notification_model_user.dart';
import 'package:webbing_fixed/network/api_configurations.dart';
import 'package:webbing_fixed/network/network_handler.dart';

class GetNotificationAdminService {
  final NetworkHandler networkHandler = NetworkHandler();

  Future<List<NotificationAdmin>> getNotificationAdmin() async {
    try {
      final response = await networkHandler.get(ApiConfigurations.getNotificationAdmin);
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data;
        return jsonList.map((json) => NotificationAdmin.fromJson(json)).toList();
      } else {
        print('فشل في تحميل الإشعارات مع كود الحالة: ${response.statusCode}');
        throw Exception('فشل في تحميل الإشعارات');
      }
    } catch (e) {
      print('فشل في تحميل الإشعارات: $e');
      throw Exception('فشل في تحميل الإشعارات: $e');
    }
  }
}
